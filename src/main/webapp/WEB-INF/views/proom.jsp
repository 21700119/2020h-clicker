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

@media screen and (max-width: 1250px) {
	.column {width: 48%; margin-left:1rem;}
	.poll-card{ width: 100%; overflow:scroll;}
	#modal_btn{width: 50%; font-size:3px;}
	.code { font-size: 14px; }
	.room_title { font-size: 19px;} 
}

@media screen and (max-width: 846px) {
	.column {width: 100%; margin-left:0rem;}
	.poll-card{ width: 100%; overflow:scroll;}
	.make{width: 50%; font-size:3px;}
	#modal_btn{width: 50%; font-size:3px;}
	.code { font-size: 13px; }
	.room_title { font-size: 17px;}
}

@media screen and (max-width: 600px) {
	.column {width: 100%; margin-left:0rem;}
	.poll-card{ width: 100%; overflow:scroll;}
	.make{width: 50%; font-size:3px;}
	#modal_btn{width: 50%; font-size:3px;}
	.code { font-size: 12px; }
	.room_title { font-size: 15px;}
}

.input{display: flex; }
.surveyCount {
	flex: 1;
	font-size: 16px;
	height: 30px;
	border: 2px solid #6c64a3;
	border-radius: 10px;
	background: #6c64a3;
	color: white;
	text-align: center;
	margin: 10px 10px 0 0;
	padding-top: 3px;
}
label{flex:4}
input:checked + .input{
	background-color: lavender;
	font-weight: bold;
}

</style>
<script>
$("input[type=radio][name=answer]").on("click", function(){
	var checkvalue = $("input[type=radio][name=answer]:checked").val();

	if(checkvalue=='yes'){
		$(".input").css('background-color','black');
	}
});
</script>
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
				<button type='button' class="make" id="all" style="background: lavender;">모든 투표</button>
				<button type='button' class="make">진행중인 투표</button>
				<button type='button' class="make">종료된 투표</button>
			</div>
			<div class="row">
				<c:forEach items="${readSurvey}" var="readSurvey" varStatus="status">
					<div class="column">
						<div class="poll-card">
							<div class="parent">
								<input type="text" name="srv_id" id="survey_name" value="${readSurvey.srv_id}" style="display:none;" />
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

							<form role="form" method="post" action="/proomAnswer/${member.user_id}/${read.room_id}/${readSurvey.srv_id}">
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
														<input type="radio" id="optiony'+${status.index}'" name="answer" value="yes" hidden>
														<div class="input">
															<label for="optiony'+${status.index}'"> Yes&nbsp;</label>
															<p class="surveyCount">32 명</p>
														</div>
													</div>
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<input type="radio" id="optionn'+${status.index}'" name="answer" value="no" hidden>
														<div class="input">
															<label for="optionn'+${status.index}'"> No&nbsp;</label>
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
														<div class="input">
															<label for="optiony" style="float:left;"> Yes&nbsp;</label>
															<p class="surveyCount">32 명</p>
														</div>
													</div>
													<div class="option">
														<div class="analytic">
															<div class="bar"></div>
															<div class="percent">50%</div>
														</div>
														<div class="input">
															<label for="optionn" style="float:left;"> No&nbsp;</label>
															<p class="surveyCount">2 명</p>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										
										<%-- <c:when test="${readSurvey.type == 2}">
											<c:choose>
												<c:when test="${readSurvey.status == true}">
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 0; i < repeat_num; i++) {
																//if(i==0) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><input type="radio" id="optionn" name="option" value="'+String.fromCharCode(97+i)+'"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">10 명</p></div></div>');
																//else if(i==1) $('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><input type="radio" id="optionn" name="option" value="'+String.fromCharCode(97+i)+'"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;">   '+String.fromCharCode(97+i)+'<i class="fa fa-check tick" style="display: block; float: left;"></i></label><p class="surveyCount">12 명</p></div></div>');
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'" style="float: left;"><input type="radio" id="option'+String.fromCharCode(97+i)+'" name="answer" value="'+i+'">   '+String.fromCharCode(97+i)+'</label><p class="surveyCount">15 명</p></div></div>');
															}
														//}
													</script>	
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>									
										</c:when> --%>
										
										<c:when test="${readSurvey.type == 3}">
											<c:choose>
												<c:when test="${readSurvey.status == true}">
													<script>
														//$(document).ready(function() {
															var repeat_num = '<c:out value="${readSurvey.content}" />';
															repeat_num *= 1;
			
															for (var i = 1; i <= repeat_num; i++) {
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><input type="radio" id="option'+${status.index}+i+'" name="answer" value="'+i+'" hidden><div class="input"><label for="option'+${status.index}+i+'"> '+i+'</label></div></div>');
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
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'">   '+i+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label></div></div>');
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
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><input type="radio" id="optiont'+${status.index}+i+'" name="answer" value="'+text[i]+'" hidden><div class="input"><label for="optiont'+${status.index}+i+'">   '+text[i]+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label></div></div>');
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
																$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="optiont'+i+'">   '+text[i]+'&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label></div></div>');
															}
														//}
													</script>	
												</c:otherwise>
											</c:choose>										
										</c:when>
									</c:choose>


									<c:if test="${readSurvey.status == true}">
										<%-- <c:if test="${bttnCount == 0}"> --%>
												<button type="submit" class="make" id="clickMe" onClick="check()">투표하기</button>
										<%-- </c:if> --%>
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