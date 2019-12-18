<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>글쓰기</title>
<style>
.tbl {
	margin: 10px;
}
</style>
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
			<table id="tbl" class="table table-bordered" border=1>
				<tr>
					<td>제목 :</td>
					<td><input type="text" id="txttitle" size=60></td>
				</tr>
				<tr>
					<td>작성자 :</td>
					<td><input type="text" id="txtwriter" size=60></td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td><textarea id="txtcontent" cols = "100" rows = "10"></textarea></td>
				</tr>
			</table>
			<input type="button" value="등록" id="insert"
				class="btn btn-primary">
		</div>
	</div>
</body>
<script>
	$("#insert").on("click", function() {
		var title = $("#txttitle").val();
		var writer = $("#txtwriter").val();
		var content = $("#txtcontent").val();

		if (title.length == 0 || writer.length == 0 || content.length == 0) {
			alert("정보를 제대로 입력해주세요.");
			return;
		}

		$.ajax({
			type : "post",
			url : "YWinsert",
			data : {
				"title" : title,
				"writer" : writer,
				"content" : content
			},
			success : function() {
				alert("저장되었습니다.");
				location.href = "YWlist";
			}
		});
	});
</script>
</html>