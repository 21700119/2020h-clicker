<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>방 리스트</title>

<!-- Bootstrap core CSS -->
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

<!-- Top bar -->
<link rel='stylesheet' href='https://unpkg.com/material-components-web@latest/dist/material-components-web.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<!-- Table Bootstrap -->
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Sweet Alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Google login -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="300362257103-id5jh2fgjlkr47lsqlpllcl6s4nome3k.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100%;
	margin: 0;
}
* {box-sizing: border-box;}
.column {
	margin: auto;
	float: left;
	width: 48%;
	padding: 10px;
	height: 300px;
	margin-top: 6%;
}
.row:after {
	content: "";
	display: table;
	clear: both;
}
.table {
	border-radius: 12px;
}
.table thead tr {
	background-color: lavender;
	border: 2px solid #ddd;
}
.table thead tr th {
	border: 2px solid #ddd;
}
.table {
	padding: 10px;
	text-align: center;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
}
.table tr td {
	border: 2px solid #ddd;
}
.title {
	font-size: 20px;
	font-weight: bold;
	margin-left: 10px;
}
.make {
	float: right;
	border: 2px solid lavender;
	border-radius: 50px;
	padding: 5px 20px 5px 20px;
	font-size: 12px;
	font-weight: bold;
	background: white;
	margin-bottom: 5px;
}
.make:hover {background: lavender;}
.main:hover {text-decoration: underline;}
.logout {padding: 1px 15px 1px 15px; color:white; border:2px solid white; border-radius:5px; background:none;}
.user {margin:13px 10px 10px 10px; font-size:17px;}
@media screen and (max-width: 600px) {
	.column {width: 95%; overflow:scroll;}
	.t {margin-top: 20%;}
	.user {font-size:11px;}
	.logout {margin-right: 15px; font-size:10px;}
	.room_title{font-size:15px;}
	.user{font-size:12px;}
}
@media screen and (min-width: 600px) {
	.t { margin-top: 5%;}
}
</style>

</head>

<body>
	<header class="mdc-top-app-bar" style="background: #6c64a3;">
		<div class="mdc-top-app-bar__row">
			<section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
				<button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons">
					<span class="material-icons">view_list</span>
				</button>
				<a class="mdc-top-app-bar__title room_title" style="color: inherit;">방 리스트</a>
			</section>
			<section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
				<p class="mdc-top-app-bar__title user"> ${member.user_id}님 </p>
        			<button class="logout" id="logoutBtn" type="button" onclick="location.href='/member/logout'">로그아웃</button>	
      		</section>
		</div>
	</header>

	<div class="row">
		<div class="column">
			<div class="t">
				<span class="title">내가 만든 방</span>
				<button class="make" onclick="mnew_room();">새로운 방 만들기</button>
			</div>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 10%;">No.</th>
						<th>방제목</th>
						<th style="width: 30%;">생성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="l" items="${list}" varStatus="md">
              		<tr>
                  		<td>${md.count}</td>
                  		<td class="main" onclick="location.href='/mroom/${l.room_id}'">${l.room_name}</td>
                  		<td>${l.md_user}</td>
             		 </tr>
         			</c:forEach>
				</tbody>
			</table>
			
		</div>
		<br>
		<div class="column">
			<div class="t">
				<span class="title">내가 참여하는 방</span>
				<button class="make" id="button" onclick=pnew_room()>새로운 방 참여하기</button>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 10%;">No.</th>
						<th>방제목</th>
						<th style="width: 30%;">생성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${plist}" varStatus="pt">
					<tr>
						<td>${pt.count}</td>
                  		<td class="main" onclick="location.href='/proom/${member.user_id}/${p.room_id}'">${p.room_name}</td>
                  		<td>${p.md_user}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script>
	function mnew_room(){
		Swal.fire({
			title: '새로운 방 만들기',
			html:
				'<form action="/insertProc" method="get" id="new_room">' +
				'<label>방 제목을 입력해주세요.</label>' +
				'<input type="text" class="form-control" id="room_name" name="room_name" placeholder="예) 수업명(분반)">'+
				'<input type="hidden" name="md_user" value="${member.user_id}">'+
				'</form>',
				showCloseButton: true,
				showConfirmButton: true,
				focusConfirm: false,
				confirmButtonText:'OK',
		}).then((result) => {
				if (result.value) {
				   $('#new_room').closest('form').submit();
				}
			});
	};
	function pnew_room(){
		Swal.fire({
			title: '새로운 방 참여하기',
			html:
				'<form action="/enterProc" method="get" id="pnew_room">'+
				'<label>방 코드를 입력해주세요.</label>'+
				'<input type="text" class="form-control" id="code" name="code" placeholder="예) ABCD">'+
				'<input type="hidden" name="pt_user" value="${member.user_id}">'+
				'</form>',
				showCloseButton: true,
				showConfirmButton: true,
				focusConfirm: false,
				confirmButtonText:'OK',
		}).then((result) => {
				if (result.value) {
				   $('#pnew_room').closest('form').submit();
				}
			});
	};
	</script>
	
</body>
</html>
