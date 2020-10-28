<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="mdc-typography">
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>만든 방</title>

<!-- app bar -->
<link rel='stylesheet'
	href='https://unpkg.com/material-components-web@latest/dist/material-components-web.css'>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="/resources/appbar.css">
<!-- poll -->
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/poll.css">
<!-- custom -->
<link rel="stylesheet" href="/resources/css/timer.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/clicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
.code {padding: 1px 13px 1px 13px; border:1.5px solid white; border-style: none none double none; font-size:16px;}
@media screen and (max-width: 600px) {
	.column {width: 100%; margin-left:0rem;}
	.poll-card{ width: 100%;}
	.make{width: 20%; font-size:3px;}
	#modal_btn{width: 30%; font-size:3px;}
	.modal_wrap{width: 80%; top: 18%; left:74%; }
	.room_title{font-size:15px;}
	.code{font-size:12px;}
	.surveyEnd{width:100%;}
}
</style>
<script>
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);

	};
</script>
</head>

<body>
	<!-- partial:index.partial.html -->
	<!-- Top App Bar -->
	<header class="mdc-top-app-bar" style="background: #6c64a3;">
		<div class="mdc-top-app-bar__row">
			<section
				class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
				<button
					class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons"
					href="#">
					<span class="material-icons">menu</span>
				</button>
				<a class="mdc-top-app-bar__title room_title" style="color: inherit;">${read.room_name} - ${read.md_user}</a>
			</section>
			<section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
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
						<a class="mdc-list-item mdc-list-item--selected demo-drawer-list-item">
						<span class="material-icons mdc-list-item__graphic">code</span>${read.code}</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="/mroom/${read.room_id}/dash_professor"> 
						<span class="material-icons mdc-list-item__graphic">favorite</span>자료실</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="/main?id=${member.user_id}">
						<span class="material-icons mdc-list-item__graphic">exit_to_app</span>방 나가기</a>
						<hr class="mdc-list-divider">
						<a class="mdc-list-item demo-drawer-list-item" href='/delete/${read.room_id}'>
						<span class="material-icons mdc-list-item__graphic">delete</span>방 파기</a>
					</div>
				</nav>
			</nav>
		</aside>

		<!-- Content -->
		<main class="mdc-drawer-app-content main-content">
			<div class="top">
				<button type='button' class="make" style="background: lavender;">모든 투표</button>
				<button type='button' id="modal_btn">새로운 투표 생성하기</button>
			</div>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<div class="modal_close">
					<a href="/mroom/${read.room_id}">close</a>
				</div>

				<div>
					<!-- <form action="/surveyProc" method="post" id="form"> -->
					<form method="post" id="form" name="surveyform">
						<label class="ex" for="survey_name">투표 제목을 입력하세요.</label>
						<fieldset>
							<input class="marg poll_title" type="text" name="survey_name"
								id="survey_name" />
							<hr>
							<!-- card -->
							<label class="ex" for="type">투표 타입을 선택하세요.</label>
							<div class="flex-container merg">
								<div class="card" id="yes">
									<input type="radio" id="y" name="type" value="1"> <label
										for="y">yes/no</label>
								</div>
								<div class="card" id="abc">
									<input type="radio" id="a" name="type" value="2"> <label
										for="a">a,b,c,...</label>
								</div>
								<div class="card" id="onetwo">
									<input type="radio" id="o" name="type" value="3"> <label
										for="o">1,2,3,...</label>
								</div>
								<div class="card" id="textt">
									<input type="radio" id="t" name="type" value="4"> <label
										for="t">text</label>
								</div>
							</div>
							<!-- dynamic add -->
							<div class="form-group merg">
								<form name="add_name" id="add_name form">
									<div class="table-responsive">
										<table class="table1 table-bordered merg" id="dynamic_field">

										</table>
									</div>
								</form>
							</div>

							<input type="submit" value="Submit" style="background: #6c64a3; color: white;"
								class="btn btn-info merg marg" onClick="check()" />
						</fieldset>

					</form>
				</div>
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
										<p id="proce" class="status">진행중</p>
									</c:when>
									<c:otherwise>
										<p id="proce" class="status_f">종료</p>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- <form role="form" method="post" action="/changeStatus/${read.room_id}"> -->
							<form name="change">
								<div class="options" id="survey_${status.index}">
									<!-- ${readSurveyType} -->
								<c:choose>
									<c:when test="${readSurvey.type == 1}">
											<div class="option">
												<div class="analytic">
													<div class="bar"></div>
													<div class="percent">50%</div>
												</div>
												<div class="input">
													<label for="optiony">Yes</label>
												</div>
											</div>
											<div class="option">
												<div class="analytic">
													<div class="bar"></div>
													<div class="percent">50%</div>
												</div>
												<div class="input">
													<label for="optionn">No</label>
												</div>
											</div>
									</c:when>
									<c:when test="${readSurvey.type == 2}">
											<script>
												$(document).ready(function() {
													var repeat_num = '<c:out value="${readSurvey.content}" />';
													repeat_num *= 1;
	
													for (var i = 0; i < repeat_num; i++) {
														$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+String.fromCharCode(97+i)+'">   '+String.fromCharCode(97+i)+'</label></div></div>');
													}
												});
											</script>
									</c:when>
									<c:when test="${readSurvey.type == 3}">
											<script>
												$(document).ready(function() {
													var repeat_num = '<c:out value="${readSurvey.content}" />';
													repeat_num *= 1;
	
													for (var i = 1; i <= repeat_num; i++) {
														$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="option'+i+'">   '+i+'</label></div></div>');
													}
												});
											</script>
									</c:when>
									<c:when test="${readSurvey.type == 4}">
											<script>
												$(document).ready(function() {
													var repeat_num = '<c:out value="${readSurvey.content}" />';
													var text = repeat_num.split(",");
	
													for (var i = 0; i < text.length; i++) {
														$('#survey_${status.index}').append('<div class="option"><div class="analytic"><div class="bar"></div><div class="percent">50%</div></div><div class="input"><label for="optiont'+i+'">   '+text[i]+'</label></div></div>');
													}
												});
											</script>
									</c:when>
								</c:choose>
								
								</div>
								<c:if test="${readSurvey.status == true}">
									<button type="submit" class="make surveyEnd">투표 종료</button>
								</c:if>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</main>
	</div>



	<!-- app bar -->
	<script
		src='https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js'></script>
	<script src="/resources/appbar.js"></script>
	<!-- poll
	<script src="resources/poll.js"></script> -->
	<!-- Custom JS -->
	<script src="/resources/js/timer.js"></script>
	<!-- modal -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>

	<script>
		var i = 1;

		$(document)
				.ready(
						function() {

							function getTimeStamp() {
								var d = new Date();

								var s = leadingZeros(d.getFullYear(), 4) + '-'
										+ leadingZeros(d.getMonth() + 1, 2)
										+ '-' + leadingZeros(d.getDate(), 2)
										+ ' ' +

										leadingZeros(d.getHours(), 2) + ':'
										+ leadingZeros(d.getMinutes(), 2) + ':'
										+ leadingZeros(d.getSeconds(), 2);

								return s;
							}

							function leadingZeros(n, digits) {
								var zero = '';
								n = n.toString();

								if (n.length < digits) {
									for (i = 0; i < digits - n.length; i++)
										zero += '0';
								}

								return zero + n;
							}

							$('.poll_title').val(getTimeStamp());

							$(".poll_title").on("click", function() {
								$(this).select();
							});

							//abc
							$('#abc')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="adda" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="a" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="b" class="form-control name_list marg" readonly /></td></tr>');

											});

							//yes
							$('#yes')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="yes" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="no" class="form-control name_list marg" readonly /></td></tr>');
											});

							//onetwo
							$('#onetwo')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="addo" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="1" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="2" class="form-control name_list marg" readonly /></td></tr>');

											});

							//textt
							$('#textt')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="addt" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" placeholder="Enter the text" class="form-control name_list marg" /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" placeholder="Enter the text" class="form-control name_list marg" /></td></tr>');

											});

							$(document)
									.on(
											'click',
											'#adda',
											function() {
												var vala = String
														.fromCharCode(97 + i - 2);
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="'+vala+'" class="form-control name_list marg" readonly /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
											});

							$(document)
									.on(
											'click',
											'#addo',
											function() {
												var valo = i - 1;
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" value="'+valo+'" class="form-control name_list marg" readonly /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
											});

							$(document)
									.on(
											'click',
											'#addt',
											function() {
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="content" placeholder="Enter the text" class="form-control name_list marg" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
											});

							$(document).on('click', '.btn_remove', function() {
								var button_id = $(this).attr("id");
								$('#row' + button_id + '').remove();
							});

							var formObj = $("form[name='change']");
							$(".surveyEnd").on("click", function(){
								formObj.attr("action", "/changeStatus/${read.room_id}");
								formObj.attr("method", "post");
								formObj.submit();			
							})

						});

		function check() {
			var Form = eval("document.surveyform");
			var ch = 0;

			if (Form.type[0].checked == true)
				ch++;
			if (Form.type[1].checked == true)
				ch++;
			if (Form.type[2].checked == true)
				ch++;
			if (Form.type[3].checked == true)
				ch++;

			if (ch == 0) {
				alert('투표 타입을 선택해주세요.');
				return false;
			} else {
				Form.action = '/surveyProc/${read.room_id}';
				Form.submit();
			}
		}

		
	</script>

</body>
</html>