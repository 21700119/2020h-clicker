<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원가입</title>

<!-- Bootstrap core CSS -->
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">

<!-- ajax -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Sweet Alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.11.0/sweetalert2.all.min.js"></script>

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
.bd-placeholder-img-lg {
	font-size: 3.5rem;
}
}
.idChk { background-color: #4287f5; border-radius: 8px; border:none; color: white;}
</style>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/login";	    
			})
		
			$("#submit").on("click", function(){
				if($("#user_id").val()==""){
					Swal.fire({
	                    icon: 'error',
	                    title: "아이디를 입력해주세요.",
	                });
					$("#user_id").focus();
					return false;
				}
				if($("#pw").val()==""){
					Swal.fire({
	                    icon: 'error',
	                    title: "비밀번호를 입력해주세요.",
	                });
					$("#pw").focus();
					return false;
				}
				if($("#name").val()==""){
					Swal.fire({
	                    icon: 'error',
	                    title: "이름을 입력해주세요.",
	                });
					$("#name").focus();
					return false;
				}
			});
			//패스워드 확인
			$(function(){ 
				$("#alert-success").hide(); 
				$("#alert-danger").hide(); 
				$("input").keyup(function(){ 
					var pwd1=$("#pw").val(); 
					var pwd2=$("#inputPassword").val(); 
					if(pwd1 != "" || pwd2 != ""){ 
						if(pwd1 == pwd2){ $("#alert-success").show(); 
						$("#alert-danger").hide(); 
						$("#submit").removeAttr("disabled"); }else{ $("#alert-success").hide(); $("#alert-danger").show(); $("#submit").attr("disabled", "disabled"); } } }); });

		});

		//아이디 중복확인
		$(document).ready(function(){
			  $("#user_id").blur(function(){
				  $.ajax({
						url : "/member/idChk",
						type : "post",
						dataType : "json",
						data : {"user_id" : $("#user_id").val()},
						success : function(data){
							if(data == 1){
								$("#id_check").text("* 중복된 아이디입니다.");
								$("#id_check").css("color", "red");
							}else if(data == 0){
								$("#idChk").attr("value", "Y");
								$("#id_check").text("* 사용가능한 아이디입니다.");
								$("#id_check").css("color", "red");
							}
						}
					})
			  });
			});
</script>
</head>
<body class="text-center" style="background:white">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<form action="/member/register" method="post" class="form-signin">
		<img class="mb-4" src="/resources/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
		
				<div class="form-group has-feedback">
<!-- 					<label class="control-label" for="user_id">아이디</label>
 -->					<input type="text" id="user_id" class="form-control" name="user_id" placeholder="ID" required autofocus> 
						<p>ex) hgu21700470</p>
						<!-- <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button> -->
						<p class="check_font" id="id_check"></p>
				</div>
				<div class="form-group has-feedback">
<!-- 					<label class="control-label" for="name">성명</label>
 -->					<input type="text" id="name" class="form-control" name="name" placeholder="Name" required autofocus> 
				</div>
				<div class="form-group has-feedback">
<!-- 					<label class="control-label" for="pw">Password</label>
 -->					<input class="form-control" type="password" id="pw" name="pw"placeholder="Password" required>
				</div>
				<label for="inputPassword" class="sr-only">Confirm_Password</label> 
				<input type="password" id="inputPassword" class="form-control" placeholder="Confirm_Password" required><br>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>​

				<div class="form-group has-feedback">
					<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit" onclick="test()">회원가입</button>
					<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='./login'">취소</button>
				</div>
			</form>

	</body>
</html>