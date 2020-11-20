<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">

<title>HELLO OAUTH</title>
</head>
<body>
	<h1>Google Login 정보</h1>
<div th:text="'TOKEN : ' + ${token}"></div>
<div th:text="'이름 : ' + ${name}"></div>
<div th:text="'Email : ' + ${email}"></div>



</body>
</html>