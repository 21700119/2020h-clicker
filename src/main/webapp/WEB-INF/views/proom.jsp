<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="mdc-typography">
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

.top {
	display: flex;
	width: 97%;
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

.make:hover {
	background: lavender;
}

#modal_btn:hover {
	background: lavender;
}

.code {
	padding: 1px 13px 1px 13px;
	border: 1.5px solid white;
	border-style: none none double none;
	font-size: 16px;
}

@media screen and (max-width: 600px) {
	.code {font-size: 12px;}
	.room_title {font-size: 15px;}
	.make { width:100%;}
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

							<form role="form" method="post" action="/proomAnswer">
								<div class="options" id="survey_${status.index}">
									<c:choose>
										<c:when test="${readSurvey.type == 1}">
											<div class="option">
												<div class="analytic">
													<div class="bar"></div>
													<div class="percent">50%</div>
												</div>
												<div class="input">
													<label for="optiony"> <input type="radio"
														id="optiony" name="answer" value="yes"> Yes&nbsp;<i
														class="fa fa-check tick" aria-hidden="true"></i></label>
												</div>
											</div>
											<div class="option">
												<div class="analytic">
													<div class="bar"></div>
													<div class="percent">50%</div>
												</div>
												<div class="input">
													<label for="optionn"> <input type="radio"
														id="optionn" name="answer" value="no"> No&nbsp;<i
														class="fa fa-check tick" aria-hidden="true"></i></label>
												</div>
											</div>

										</c:when>
										<c:when test="${readSurvey.type == 2}">
											<script>
												//$(document).ready(function() {
													var repeat_num = '<c:out value="${readSurvey.content}" />';
													repeat_num *= 1;
	
													for (var i = 0; i < repeat_num; i++) {
														$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'"><input type="radio" id="option'+String.fromCharCode(97+i)+'" name="answer" value="'+String.fromCharCode(97+i)+'">   '+String.fromCharCode(97+i)+'</label></div></div>');
													}
												//}
											</script>
										</c:when>
										<c:when test="${readSurvey.type == 3}">
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
										<c:when test="${readSurvey.type == 4}">
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
									</c:choose>


									<c:if test="${readSurvey.status == true}">
										<button type="submit" class="make">투표하기</button>
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