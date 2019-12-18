<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.tbl {
	margin: 10px;
}
.tbl-each:HOVER{
	background: #98AFC7;
}
#darken {
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	height: 100%;
	width: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	overflow-y: scroll;
	display: none;
}

#lightbox {
	width: 960px;
	margin: 20px auto;
	padding: 15px;
	border: 1px solid #333333;
	border-radius: 5px;
	background: white;
	box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
	text-align: center;
}
</style>
<title>Game search</title>
</head>
<body>
	<div class="tbl">
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

		<h1>[DG 게시판]</h1>
		<div>
			<select id="searchType">
				<option value="title">제목</option>
				<option value="writer">글쓴이</option>
			</select> <input type="text" id="keyword"> 
			<input type="button" value=" search " id="search" class="btn btn-primary"> 
			총 데이터 : <span id="total"></span>
		</div>

		<table id="tbl" class="table table-bordered" border=1 style = "text-align: center;"></table>
		<script id="temp" type="text/x-handlebars-template">
		<tr style = "background: #DEDEDC;">
			<td><b>No</b></td>
			<td><b>제목</b></td>
			<td><b>글쓴이</b></td>
			<td><b>등록일</b></td>
		</tr>
		{{#each list}}
			<tr class = "tbl-each" id = {{id}} title = {{title}} writer = {{writer}} wdate = {{wdate}}>
				<td class = "id">{{id}}</td>
				<td>{{title}}</td>
				<td>{{writer}}</td>
				<td>{{wdate}}</td>
			</tr>
		{{/each}}
	</script>
		<button onClick="location.href = 'YWinsert'" class="btn btn-primary">글쓰기</button>
		<div>
			<ul id="pagination" class="pagination"></ul>
		</div>
	</div>

	<!-- 라이트박스 -->

	<div id="darken">
		<div id="lightbox">
			<h1>[DG 게시판]</h1>
			<input type="hidden" id="did">
			<table class="table table-bordered" border=1>
				<tr>
					<td><b>제목</b></td>
					<td><input type="text" id="dtitle" size=60></td>
				</tr>
				<tr>
					<td><b>글쓴이</b></td>
					<td><input type="text" id="dwriter" size=60 readonly></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td><textarea id="dcontent" cols = "100" rows = "10"></textarea></td>
				</tr>
			</table>
			<input type="button" value="수정" id="update" class="btn btn-primary">
			<input type="button" value="삭제" id="delete" class="btn btn-primary">
			<input type="button" value="닫기" id="btnClose" class="btn btn-primary">
		</div>
	</div>
</body>
<script>
	var page = 1;
	var searchType = $("#searchType").val();
	var keyword = $("#keyword").val();

	$("#update").on("click", function() {
		if (confirm("수정하시겠습니까?")) {
			var id = $("#did").val();
			var title = $("#dtitle").val();
			var writer = $("#dwriter").val();
			var content = $("#dcontent").val();

			$.ajax({
				type : "post",
				url : "YWupdate",
				data : {
					"id" : id,
					"title" : title,
					"writer" : writer,
					"content" : content
				},
				success : function() {
					alert("수정되었습니다.");
					$("#darken").hide();
					getList();
				},
				error : function() {
					alert("수정을 실패하였습니다.");
				}
			});

		}
	});

	$("#tbl").on("click", ".tbl-each", function() {
		$("#darken").show();

		var id = $(this).attr("id");
		$("#did").val(id);

		$.ajax({
			type : "get",
			url : "YWread.json",
			data : {
				"id" : id
			},
			success : function(data) {
				$("#dtitle").val(data.title);
				$("#dwriter").val(data.writer);
				$("#dcontent").val(data.content);
			}
		});
	});

	$("#btnClose").on("click", function() {
		$("#darken").hide();
	});

	$("#search").on("click", function() {
		searchType = $("#searchType").val();
		keyword = $("#keyword").val();
		page = 1;
		getList();
	});

	getList();

	function getList() {
		$.ajax({
			type : "get",
			url : "YWlist.json",
			dataType : "json",
			data : {
				"page" : page,
				"searchType" : searchType,
				"keyword" : keyword
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#total").html(data.total);

				var str = "";
				if (data.pm.prev) {
					str = str + " " + "<li>" + "<a class='btn btn-info' href='"
							+ (data.pm.startPage - 1) + "'>Pre</a></li>";
				}

				for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
					if (page == i) {
						str = str + " " + "<li class = 'active'>"
								+ "<a class='btn btn-info' href='" + i + "'>"
								+ i + "</a></li>";
					} else {
						str = str + " " + "<li>"
								+ "<a class='btn btn-info' href='" + i + "'>"
								+ i + "</a></li>";
					}

				}

				if (data.pm.next) {
					str = str + " " + "<li>" + "<a class='btn btn-info' href='"
							+ (data.pm.endPage + 1) + "'>Next</a></li>";
				}

				$("#pagination").html(str);
			}
		});
	}

	$("#pagination").on("click", "li a", function(event) {
		event.preventDefault();
		page = $(this).attr("href");
		getList();
	});

	$("#keyword").keydown(function(key) {
		if (key.keyCode == 13) {
			searchType = $("#searchType").val();
			keyword = $("#keyword").val();
			page = 1;
			getList();
		}
	});

	$("#delete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		var id = $("#did").val();
		$.ajax({
			type : "post",
			url : "YWdelete",
			data : {
				"id" : id
			},
			success : function() {
				alert("삭제되었습니다.");
				$("#darken").hide();
				getList();
			}
		});
	});
</script>
</html>