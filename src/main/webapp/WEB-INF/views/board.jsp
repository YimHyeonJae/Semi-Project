<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Monster Hunter World : Ice Borne</title>

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
	<div id="body" style="width:100%; height:400px;" >
		<div id="body-image" style="padding-top:30px; position:relative; ; width:70%; float:left; background-color:#FCD1B5; overflow: hidden;">
				<div style="padding:10px; margin:0px auto; text-align:center;">
					<div class="mhw" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/MH-IB0.jpg" width=100% onClick="window.open('https://www.monsterhunter.com/world-iceborne/kr/')">
						<div><b>&lt;MonsterHunterWorld : Site&gt;</b></div>
					</div>
					<div class="mhw" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/MH-IB1.jpg" width=100% onClick="window.open('http://mh.inven.co.kr/')">
						<div><b>&lt;MonsterHunterWorld : Inven&gt;</b></div>
					</div>
					<div class="mhw" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/MH-IB2.jpg" width=100% onClick="window.open('https://store.steampowered.com/app/1118010/Monster_Hunter_World_Iceborne/')">
						<div><b>&lt;MonsterHunterWorld : Steam&gt;</b></div>
					</div>
					
					<div class="dg2" style="float:left; width:56%; height:260px; margin:2px auto; padding:2px">
						<img src="resources/img/DG2 - 1.jpg" width=100% onClick="window.open('https://www.bungie.net/ko/')">
						<div><b>&lt;Destiny Guardians 2 : Site&gt;</b></div>
					</div>
					<div class="dg2" style="float:left; width:42%; height:260px; margin:2px auto; padding:2px">
						<img src="resources/img/DG2 - 2.jpg" width=100% onClick="window.open('http://dg.inven.co.kr/')">
						<div style="height:10px"><b>&lt;Destiny Guardians 2 : Inven&gt;</b></div>
					</div>
					<br><br>
					<div class="df" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/DF - 1.jpg" width=100% onClick="window.open('http://df.nexon.com/df/home')">
						<div><b>&lt;Dungeon & Fighter : OfficialSite&gt;</b></div>
					</div>
					<div class="df" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/DF - 2.jpg" width=100% onClick="window.open('http://df.inven.co.kr/')">
						<div><b>&lt;Dungeon & Fighter : Inven&gt;</b></div>
					</div>
					<div class="df" style="float:left; width:33%; margin:2px auto; padding:2px">
						<img src="resources/img/DF - 3.jpg" width=100% onClick="window.open('https://gall.dcinside.com/board/lists/?id=d_fighter_new1')">
						<div><b>&lt;Dungeon & Fighter : Gallary&gt;</b></div>
					</div>
				</div>
		</div>
		<div id="body-rank" style="padding-top:30px; position: fixed; width:25%; position:relative; float:left; background-color:#A4BBC8;">
			<table class="table" id="rank-table" border=1 style="margin:10px; width:300px; background-color:white;"></table>
			<script id="temp" type="text/x-handlebars-template">
				<tr style="font-size:18px; background-color:#98AFC7">
					<th>Rank</th>
					<th>Title</th>
				</tr>
				{{#each .}}
					<tr class="box">
						<td class="rank">{{rank}}</td>
						<td class="title"><a href="{{link}}">{{name}}</a></td>
					</tr>
				{{/each}}
			</script>
		</div>
		<div id="body-schedule" style="padding-top:30px; position: fixed; width:25%; position:relative; float:left; background-color:#455B71;">
			<table class="table1" id="schedule-table"style="margin:10px; width:300px; background-color:white;" border=1></table>
			<script id="temp1" type="text/x-handlebars-template">
				<tr style="font-size:18px; background-color:#034F84; color:white;">
					<th style="border:1px soild black;"><b>발매 예정작</b></th>
				</tr>
				{{#each .}}
					<tr class="schedule-table">
						<td class="schedule"><a href="{{glink}}">{{gname}}</a></td>
					</tr>
				{{/each}}
			</script>
		</div>
	</div>
</body>

<script>

	getlist();
	
	function getlist(){
		$.ajax({
			type:"get",
			url:"search.json",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#rank-table").html(temp(data));
			}
		});
	}
	
	getschedule();
	
	function getschedule(){
		$.ajax({
			type:"get",
			url:"schedule.json",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp1").html());
				$("#schedule-table").html(temp(data));
			}
		});
	}
</script>


</html>