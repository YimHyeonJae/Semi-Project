<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="${pageContext.request.contextPath}/resources/style.css"	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inven</title>

</head>
<body>
	<div id="header" style="height: 25px; width:100%;">
	    <nav class="navbar navbar-inverse navbar-fixed-top">
	        <div class="container"><a class="navbar-brand" href="board">Media Query Semi-Project Main Page</a>
	            <ul class="nav nav-pills"  style="float:right; margin-top:5px;">
				  <li role="presentation" class="active"><a href="board">Home</a></li>
				  <li role="presentation"><a href="YWlist">영웅</a></li>
				  <li role="presentation"><a href="MHlist">민호</a></li>
				  <li role="presentation"><a href="list">승주</a></li>
				  <li role="presentation"><a href="SK">성겸</a></li>
				</ul>
	        </div>
	    </nav>
	</div>
	<div style="padding-top:30px; height:30px;">
	</div>
	<h1>게임 DB</h1><br>
	<div style="text-align:center; margin:0px auto;">
		<select id="searchType" >
			<option value="name" >게임명</option>
			<option value="genre">장르</option>
			<option value="rating">평점순</option>
		</select> 
		<input type="text" id="keyword"> 
		<input type="button" id="search" value="검  색"> <br> 
			검색 수 : <span id="total"></span>
	</div>
	<br>
	<div class="left">
	<table id="tbl" border=1 width=800></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="main">
			<td width=250>게임명</td>
			<td width=100>장르</td>
			<td width=150>개발사</td>
			<td width=50>평점</td>
			<td width=50>수정</td>
		</tr>		
		{{#each list}}
		<tr class="row" name={{name}} genre={{genre}} developer={{developer}} rating={{rating}}>
			<td class= "name">{{name}}</td>
			<td>{{genre}}</td>
			<td>{{developer}}</td>
			<td>{{rating}}</td>
			<td><button class="update" uname="{{name}}">수정</button></td>
		</tr>
		{{/each}}
		</script>
	</div>
	
	<br>
	
	<button onClick="location.href='MHinsert'" style="margin-left:1085px; text-align:center;">[DB추가]</button>
	<br><br>
	<div id="pagination" style="text-align:center;"></div>

	<!-- 라이트박스 -->
	<div id="darken-background">
		<div id="lightbox">
			<h1>[DB 수정 및 삭제]</h1>
			
			<table border=1 width=500 class="frm">
				<tr>
					<td width=100>게임명</td>
					<td><input type="text" id="edtname" readonly size=40></td>
				</tr>
				<tr>
					<td width=100>장르</td>
					<td><input type="text" id="edtgenre"></td>
				</tr>
				<tr>
					<td width=100>개발사</td>
					<td><input type="text" id="edtdeveloper" size=40></td>
				</tr>
				<tr>
					<td width=100>평점</td>
					<td><input type="text" id="edtrating" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
			</table>
			<br>
			<button id="btnupdate">[수정]</button>
			<button id="btndelete">[삭제]</button>
			<button id="Close" href="#">[닫기]</button>

		</div>
	</div>
	
	<div class="sub">
	<!--  크롤링 -->
	<div style="text-align:center;"><h3>[Inven 게임 리뷰 ]</h3>
	<a href="http://www.inven.co.kr/webzine/news/?sclass=12&platforms=gamereview">[리뷰사이트로 이동]</a><br><br></div>
	<table border=1 id="tbl1"></table>
	<script id="temp1" type="text/x-handlebars-template">
		
		{{#each .}}
		<tr>
			<th rowspan=2>
				<a href="{{link}}"><img src="{{banner}}" width=200 height=200 margin-right:30px;></a>
			</th>
			<td>[기사제목]&nbsp: {{title}} </td>	
		</tr>
		<tr>		
			<td>{{summary}}</td>
		</tr>
		{{/each}}
	</script>
	</div>
</body>
<script>
	var page = 1;
	var searchType=$("#searchType").val();
	var keyword = $("#keyword").val();

	getlist();
	getview();
	$("#tbl").on("click", ".row .update", function() {
		var name = $(this).attr("uname");
		$("#edtname").val(name);
		$("#darken-background").show();
		$.ajax({
			type : "get",
			url : "read.json",
			data : {"name" : name},
			success : function(data) {
				$("#edtgenre").val(data.genre);
				$("#edtdeveloper").val(data.developer);
				$("#edtrating").val(data.rating);
			}
		});
	});

	$("#btndelete").on("click", function() {
		if (confirm("삭제하시겠습니까?")) {
			var name = $("#edtname").val();
			$.ajax({
				type : "post",
				url : "delete",
				data : {
					"name" : name
				},
				success : function(result) {
					if (result == "SUCCESS") {
						alert("삭제완료");
						$("#darken-background").hide();
						getlist();
					} else {
						alert("삭제실패");
					}
				}
			});
		}
	});

	$("#btnupdate").on("click", function() {
		var rating = $("#edtrating").val();
		var genre = $("#edtgenre").val();
		var developer = $("#edtdeveloper").val();
		var name = $("#edtname").val();
		$.ajax({
			type : "post",
			url : "update",
			data : {
				"name" : name,
				"genre" : genre,
				"developer" : developer,
				"rating" : rating
			},
			success : function(result) {
				if (result == "SUCCESS") {
					alert("수정완료");
					$("#darken-background").hide();
					getlist();
				} else {
					alert("수정실패");
				}
			}
		});
	});

	$("#Close").on("click", function() {
		$("#darken-background").hide();
	});
	function getlist() {
		$.ajax({
			type : "get",
			url : "MHlist.json",
			dataType : "json",
			data : {"page":page,"searchType":searchType,"keyword":keyword},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#total").html(data.total);

				var str = "";
				if (data.pm.prev) {
					str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>";
				}
				for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
					str += "<a href='" + i + "'>" + i + "</a> ";
				}
				if (data.pm.next) {
					str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>";
				}
				$("#pagination").html(str);
			}
		});
	}
	$("#search").on("click", function(){
		searchType = $("#searchType").val();
		keyword = $("#keyword").val();
		page=1;
		getlist();
	});
	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getlist();
	});

   // 크롤링 게임리뷰 
	function getview() {
		$.ajax({
			type : "get",
			url : "View.json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl1").append(temp(data)).listview("refresh"); // 모바일웹은 .listview("refresh") 코드가 추가됨.
			}
		});

	}
	
	
	
	
	
</script>
</html>