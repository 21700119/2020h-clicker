<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>로그인</title>
	
<!-- Bootstrap core CSS -->
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg { font-size: 3.5rem;}
}
</style>
</head>

<body class="text-center" style="background:white">

	<form class="form-signin" name='loginpage' method="post" action="/member/login">
		<img class="mb-4" src="/resources/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">LOGIN</h1>	
		<c:if test="${member == null}">
			<div>
				<label for="user_id" class="sr-only">ID</label> 
				<input type="text" id="user_id" class="form-control" name="user_id" placeholder="ID" required autofocus> 
			</div>
			<div>
				<label for="pw" class="sr-only">Password</label> 
				<input class="form-control" type="password" id="pw" name="pw"placeholder="Password" required>
			</div>

			<div>
				<button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
				<button type="button" class="btn btn-lg btn-primary btn-block" onclick="location.href='./register'">회원가입</button>
			</div>
		</c:if>
			<div id="googleLoginBtn" style="cursor: pointer; margin: 5%;">
			<img id="googleLoginImg" src="../../../resources/img/google_icon.png" width="17.5%" height="7%">
			구글로 로그인
			</div>
	</form>
	
	
	<script>
		const onClickGoogleLogin = (e) => {
	 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?client_id=610529326658-o5mjmgvss1bss8t12gsm5faf274vmbhd.apps.googleusercontent.com&redirect_uri=http://localhost:8080/login/google/auth&response_type=code&scope=email%20profile%20openid%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive.file&access_type=offline")
	 	}
		
		const googleLoginBtn = document.getElementById("googleLoginBtn");
		googleLoginBtn.addEventListener("click", onClickGoogleLogin);
	</script>
</body>
</html>


