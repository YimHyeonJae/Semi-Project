<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/style.css"	rel="stylesheet">
<title>DB 입력</title>
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
	<div style="height:30px; padding-top:30px;">
	</div>
			<h1>[DB 추가]</h1>
			<br><br>
	<form name="frm" action="MHinsert" method="post" class="frm">
	<table border=1 width=700>
		<tr>
			<td wdith=100 class="main">게임명</td>
			<td><input type="text" name="name" size=50></td>
		</tr>
		<tr>
			<td wdith=100 class="main">장르</td>
			<td><input type="text" name="genre"></td>
		</tr>
		<tr>
			<td wdith=100 class="main">개발사</td>
			<td><input type="text" name="developer" size=50></td>
		</tr>
		<tr>
			<td wdith=100 class="main">평점</td>
			<td><input type="text" name="rating"
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</td>
		</tr>
	</table>
	<br>
	<input type=submit value="입력"> 
	<input type="reset" value="취소">
	<input type="button" onClick="location.href='MHlist'" value="게임DB로 돌아가기">
	</form>
</body>

</html>