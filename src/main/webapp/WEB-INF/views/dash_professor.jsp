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
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">

	<c:set var = "sum" value = "0" />
	<c:set var = "usercount" value = "0" />
		var arr_x = new Array();

		<c:forEach items="${readSurvey}" var="surveyList" varStatus="status"> 
		 	<c:set var= "sum" value="${sum + surveyList.end_time}"/>
		 	<c:set var = "usercount" value = "${status.count}" />
		 	arr_x.push({
				survey_name: "${surveyList.survey_name}"
		        ,reg_date : "${surveyList.reg_date}"});
		</c:forEach>
		var average_time = sum / usercount;
		average_time = ${average_time};
		System.out.println(average_time);
		System.out.println(surveyList.survey_name);
		
</script>
  <!-- Top App Bar -->
  <header class="mdc-top-app-bar" style="background:#6c64a3;">
    <div class="mdc-top-app-bar__row">
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
        <button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons" onclick="location.href='/mroom/${read.room_id}'">
          <span class="material-icons">keyboard_backspace</span>
        </button>
        <a class="mdc-top-app-bar__title" style="color: inherit;">자료실</a>
      </section>
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
        <button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons" href="#">
          <span class="material-icons">get_app</span>
        </button>
      </section>
    </div>
  </header>

  <section class="marg">
    <section class="section">
      <div class="columns">
        <div class="column is-6">
          <h2 class="title is-3">투표 완료 현황</h2>
          <p class="ex"> 해당날일에 생성한 모든 투표에 대해, 전체학생수 중 투표완료한 학생수입니다.</p><hr>
          <p>총 인원수: ${roomusercount} 명</p>
          <canvas id="myBarGraph"></canvas>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="columns">
        <div class="column is-6">
          <h2 class="title is-3">설정한 시간과 평균 완료 시간 (분)</h2>
          <p class="ex"> 투표를 생성할 때 설정한 시간과 투표완료한 학생들의 평균 완료시간을 비교한 것입니다.</p><hr>
          <div class="myTime" style="float: left;"></div>
          <p style="float: left; margin-left: 10px;">설정한 시간</p>
          <div class="averageTime" style="float: left; margin-left: 30px;"></div>
          <p style="float: left; margin-left: 10px;">평균 완료 시간</p>
          <canvas id="myGraph"></canvas>
        </div>
      </div>
    </section>
  </section>

<!-- app bar -->
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script type="text/javascript" src="/resources/js/dash_professor.js"></script>
</body>
</html>
