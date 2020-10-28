<head>
  <meta charset=utf-8 />
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
  <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://www.google.com/jsapi"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.28/vue.min.js"></script>

  <title>자료실</title>

  <link rel= "stylesheet" type="text/css" href="/resources/css/dash_student.css">
</head>
<body>
<script type="text/javascript">
${answerCount}
</script>
  <!-- Top App Bar -->
  <header class="mdc-top-app-bar" style="background:#6c64a3;">
    <div class="mdc-top-app-bar__row">
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
        <button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons" onclick="location.href='/proom/${read.room_id}'">
          <span class="material-icons">keyboard_backspace</span>
        </button>
        <a class="mdc-top-app-bar__title" href="https://www.webdenim.io" target="_blank" style="color: inherit;">자료실</a>
      </section>
    </div>
  </header>

  <section class="marg">
  	<h2 class="title is-3">Today 요약</h2>
    <p class="ex">오늘 ${readAnswer.user_id}님의 투표완료갯수는 전보다 10%증가하였습니다.</p><hr>
    <div class="complete">
      <div id="chart" class="left"></div>
      <div id="chart2" class="right"></div>
    </div>

    <section class="section">
      <div class="columns">
        <div class="column is-6">
          <h2 class="title is-3">나의 완료 시간과 평균 완료 시간 (분)</h2>
          <p class="ex"> 해당날일에 생성한 모든 투표에 대해, 나의 총 완료 시간과 학생들의 총 평균 완료 시간을 비교한 것입니다.</p><hr>
          <div class="myTime" style="float: left;"></div>
          <p style="float: left; margin-left: 10px;">나의 완료 시간</p>
          <div class="averageTime" style="float: left; margin-left: 30px;"></div>
          <p style="float: left; margin-left: 10px;">평균 완료 시간</p>
          <canvas id="myGraph"></canvas>
        </div>
      </div>
    </section>

    <div class="section">
      <h2>미완료 List</h2>
      <p class="ex"> 오늘 생성한 모든 투표에 대해, 내가 완료하지 못한 투표 List입니다.</p><hr>
      <div id="list">
       <table>
         <tr v-for="prob in problem2">
           <td>
             <span v-show="!prob.go">{{prob.number}}</span>
             <input type="text" v-model="prob.number" v-show="prob.go">
           </td>
           <td width="20%">
             <button v-show="!prob.go" on:click="goProblem()" class="btn">Go</button>
           </td>
         </tr>
       </table>
      </div>
    </div>
  </section>
  <footer></footer>

  <script type="text/javascript" src="/resources/js/dash_student.js"></script>

</body>
