<!DOCTYPE html>
<html lang="en" class="mdc-typography">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>참여 방</title>

<!-- app bar -->
<link rel='stylesheet' href='https://unpkg.com/material-components-web@latest/dist/material-components-web.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="/resources/appbar.css">

<!-- poll -->
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/poll.css">

<!-- custom -->
<link rel="stylesheet" href="/resources/css/timer.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/clicker.css">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<style>
* { box-sizing: border-box; }
.top {
	display: flex;
	width: 97%;
}
.column {
	margin: auto;
	float: left;
	width: 33.3%;
	padding: 10px;
	height: 300px;
	margin-top: 2%;
}
.row:after {
	content: "";
	display: table;
	clear: both;
}
.poll-card{
	width: 400px;
	height:280px;
	border: 1px solid #555;
	border-radius: 4px;
	box-shadow: 0 0 5px rgba(0,0,0,0.3);
	padding: 1rem 1.5rem;
	overflow: scroll;
}
#modal_btn, .make {
	border: 2px solid lavender;
	border-radius: 50px;
	padding: 5px 20px 5px 20px;
	font-weight: bold;
	background: white;
	margin-left: 5px;
	font-size: 12px';
}
.make:hover { background: lavender;}
#modal_btn:hover { background: lavender;}
.code {
	padding: 1px 13px 1px 13px;
	border: 1.5px solid white;
	border-style: none none double none;
	font-size: 16px;
}
.parent {display:flex;}
.question {flex:4;}
.status, .status_f {flex:1;  border-radius: 50px; text-align:center;}
.status {background: lightblue; border: border: 2px solid lightblue;}
.status_f {border: border: 2px solid lavender; background: lightgrey;}

@media screen and (max-width: 600px) {
	.column {width: 100%; margin-left:0rem;}
	.poll-card{ width: 100%; overflow:scroll;}
	.make{width: 50%; font-size:3px;}
	#modal_btn{width: 50%; font-size:3px;}
	.code { font-size: 12px; }
	.room_title { font-size: 15px;}
}

.surveyCount {
	float: right;
	font-size: 16px;
	height: 30px;
	width: 65px;
	border: 2px solid #6c64a3;
	border-radius: 10px;
	background: #6c64a3;
	color: white;
	text-align: center;
	margin: 10px 10px 0 0;
	padding-top: 3px;
}

.surveyCount_b {
	background: lavender;
}

</style>
</head>

<body>
	<!-- Top App Bar -->
	<header class="mdc-top-app-bar" style="background: #6c64a3;">
		<div class="mdc-top-app-bar__row">
			<section
				class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
				<button
					class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons">
					<span class="material-icons">menu</span>
				</button>
				<a class="mdc-top-app-bar__title room_title" style="color: inherit;">${read.room_name}
					- ${read.md_user}</a>
			</section>
			<section
				class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end"
				role="toolbar">
				<p class="mdc-top-app-bar__title user code">방 입장코드: ${read.code}</p>
			</section>
		</div>
	</header>

	<div class="app-drawer-layout mdc-top-app-bar--fixed-adjust">
		<!-- Drawer -->

		<aside class="mdc-drawer mdc-drawer--dismissible demo-drawer">
			<nav class="mdc-drawer__drawer">
				<nav class="mdc-drawer__content">
					<div id="icon-with-text-demo" class="mdc-list">
						<a
							class="mdc-list-item mdc-list-item--selected demo-drawer-list-item">
							<span class="material-icons mdc-list-item__graphic">code</span>${read.code}</a>
						<a class="mdc-list-item demo-drawer-list-item"
							href="/proom/${read.room_id}/dash_student"> <span
							class="material-icons mdc-list-item__graphic">favorite</span>자료실
						</a> <a class="mdc-list-item demo-drawer-list-item"
							href="/main?id=${member.user_id}"> <span
							class="material-icons mdc-list-item__graphic">exit_to_app</span>방
							나가기
						</a>

					</div>
				</nav>
			</nav>
		</aside>

		<!-- Content -->
		<main class="mdc-drawer-app-content main-content">
			<div class="top">
				<button type='button' class="make" id="all"
					style="background: lavender;">모든 투표</button>
			</div>
			<div class="row">
				<c:forEach items="${readSurvey}" var="readSurvey" varStatus="status">
					<div class="column">
						<div class="poll-card">
							<div class="parent">
								<input type="hidden" name="srv_id" value="${readSurvey.srv_id}">
								<p class="question" style="display: inline-block">
									${readSurvey.survey_name}</p>
								<c:choose>
									<c:when test="${readSurvey.status == true}">
										<p class="status">진행중</p>
									</c:when>
									<c:otherwise>
										<p class="status_f">종료</p>
									</c:otherwise>
								</c:choose>
							</div>

							<form role="form" method="post" action="/proomAnswer/${read.room_id}/${readSurvey.srv_id}">
								<div class="options" id="survey_${status.index}">
									<c:choose>
										<c:when test="${readSurvey.type == 1}">
											<c:choose>
												<c:when test="${readSurvey.status == true}">
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<div class="input">
															<label for="optiony" style="float:left;"> Yes&nbsp;<i class="fa fa-check tick" aria-hidden="true" style="display: block; float: left;"></i></label>
															<p class="surveyCount">32 명</p>
														</div>
													</div>
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<div class="input">
															<label for="optionn" style="float:left;"> No&nbsp;<i
																class="fa fa-check tick" aria-hidden="true"></i></label>
															<p class="surveyCount">2 명</p>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<div class="input surveyCount_b">
															<label for="optiony" style="float: left;"> Yes&nbsp;<i
																class="fa fa-check tick" aria-hidden="true"></i></label>
															<p class="surveyCount">27 명</p>
														</div>
													</div>
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<div class="input">
															<label for="optionn" style="float: left;"> No&nbsp;<i
																class="fa fa-check tick" aria-hidden="true"></i></label>
															<p class="surveyCount">7 명</p>
														</div>
													</div>
												</c:otherwise>
											</c:choose>


										</c:when>
										<c:when test="${readSurvey.type == 2}">
											<c:choose>
												<c:when test="${bttnCount == 1}">
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 0; i < repeat_num; i++) {
																if(i==0) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">10 명</p></div></div>');
																else if(i==1) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;">   '+String.fromCharCode(97+i)+'<i class="fa fa-check tick" style="display: block; float: left;"></i></label><p class="surveyCount">12 명</p></div></div>');
																else $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">15 명</p></div></div>');
															}
														//}
													</script>
												</c:when>
												<c:otherwise>
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 0; i < repeat_num; i++) {
																if(i==0) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;"><input type="radio" id="option'+String.fromCharCode(97+i)+'" name="answer" value="'+String.fromCharCode(97+i)+'">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">10 명</p></div></div>');
																else if(i==1) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;"><input type="radio" id="option'+String.fromCharCode(97+i)+'" name="answer" value="'+String.fromCharCode(97+i)+'">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">11 명</p></div></div>');
																else $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;"><input type="radio" id="option'+String.fromCharCode(97+i)+'" name="answer" value="'+String.fromCharCode(97+i)+'">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">15 명</p></div></div>');
																
															}
														//}
													</script>
												</c:otherwise>
											</c:choose>											
										</c:when>
										<c:when test="${readSurvey.type == 3}">
											<c:choose>
												<c:when test="${readSurvey.status == true}">
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 1; i <= repeat_num; i++) {
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'"><input type="radio" id="option'+i+'" name="answer" value="'+i+'">   '+i+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label></div></div>');
															}
														//}
													</script>
												</c:when>
												<c:otherwise>
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 1; i <= repeat_num; i++) {
																if(i==3) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'" style="float: left;">   '+i+'&nbsp;<i class="fa fa-check tick" style="display: block; float: left;"></i></label><p class="surveyCount">17 명</p></div></div>');
																else if(i==4) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input surveyCount_b"><label for="option'+i+'" style="float: left;">   '+i+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label><p class="surveyCount">20 명</p></div></div>'); 
																else if(i==5) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'" style="float: left;">   '+i+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label><p class="surveyCount">3 명</p></div></div>'); 
																else $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'" style="float: left;">   '+i+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label><p class="surveyCount">0 명</p></div></div>');
															}
														//}
													</script>
												</c:otherwise>
											</c:choose>
											
										</c:when>
										<c:when test="${readSurvey.type == 4}">
											<c:choose>
												<c:when test="${readSurvey.status == true}">
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															var text = repeat_num.split(",");
			
															for (var i = 0; i < text.length; i++) {
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="optiont'+i+'"><input type="radio" id="optiont'+i+'" name="answer" value="'+text[i]+'">   '+text[i]+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label></div></div>');
															}
														//}
													</script>
												</c:when>
												<c:otherwise>
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															var text = repeat_num.split(",");
			
															for (var i = 0; i < text.length; i++) {
																if(i==0) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="optiont'+i+'" style="float: left;">   '+text[i]+'&nbsp;<i class="fa fa-check tick" style="display: block; float: left;"></i></label><p class="surveyCount">10 명</p></div></div>');
																else $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input surveyCount_b"><label for="optiont'+i+'" style="float: left;">   '+text[i]+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label><p class="surveyCount">30 명</p></div></div>');
															}
														//}
													</script>
												</c:otherwise>
											</c:choose>
											
										</c:when>
									</c:choose>


									<c:if test="${readSurvey.status == true}">
										<c:if test="${readSurvey.type != 1}">
											<c:if test="${bttnCount != 1}">
												<button type="submit" class="make" id="clickMe" onClick="check()">투표하기</button>
											</c:if>
										</c:if>
									</c:if>

								</div>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</main>
	</div>

	
	<!-- appbar -->
	<script
		src='https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js'></script>
	<script src="/resources/appbar.js"></script>

</body>
</html>