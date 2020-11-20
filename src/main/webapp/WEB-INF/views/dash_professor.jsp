<html>
<head>
<meta charset=utf-8 />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>자료실</title>

<!-- appbar -->
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- custom -->
<link rel= "stylesheet" type="text/css" href="/resources/css/dash_professor.css">
<style>
 @media screen and (max-width: 600px) {
	.title {font-size:15px;}
	.ex {font-size:10px;}
	.total {font-size:10px;}
  }
</style>
</head>

<body>
  <!-- Top App Bar -->
  <header class="mdc-top-app-bar" style="background:#6c64a3;">
    <div class="mdc-top-app-bar__row">
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
        <button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons" onclick="location.href='/mroom/${read.room_id}'">
          <span class="material-icons">keyboard_backspace</span>
        </button>
        <a class="mdc-top-app-bar__title" style="color: inherit;">자료실</a>
      </section>
    </div>
  </header>

  <section class="marg">
    <section class="section">
      <div class="columns">
        <div class="column is-6">
          <h2 class="title is-3">투표 완료 현황</h2>
          <p class="ex"> 생성된 투표에 대해, 각 투표를 완료한 총 학생수입니다.</p><hr>
          <p class="total">총 인원수: 3 명</p>
          <canvas id="myBarGraph"></canvas>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="columns">
        <div class="column is-6">
          <h2 class="title is-3">완료 시간 비교 (초)</h2>
          <p class="ex"> 첫 투표자의 완료시간과 마지막 투표자의 완료시간을 비교한 것입니다.</p><hr>
          <div class="myTime" style="float: left;"></div>
          <p style="float: left; margin-left: 10px;" class="total">마지막 투표자 완료시간</p>
          <div class="averageTime" style="float: left; margin-left: 30px;"></div>
          <p style="float: left; margin-left: 10px;" class="total">첫 투표자 완료시간</p>
          <canvas id="myGraph"></canvas>
        </div>
      </div>
    </section>
  </section>

<!— app bar —>
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!— chart —>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script type="text/javascript" src="/resources/js/dash_professor.js"></script>
</body>
</html>