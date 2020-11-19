var chartSelector = '#chart';
var chartSelector2 = '#chart2';

var labelSelector = '> g:eq(1) g text';

var data = [
  [ '완료', 0],
  [ '미완료', 100 ]
];
var data2 = [
  [ '완료', 60],
  [ '미완료', 40 ]
];

google.load('visualization', '1.1', { packages: ['corechart', 'line'] });

google.setOnLoadCallback(function() {
  var table = new google.visualization.DataTable({
    cols : [
      { id : 'name', label : 'Name', type : 'string' },
      { id : 'value', label : 'Value', type : 'number' }
    ]
  });
  var table2 = new google.visualization.DataTable({
    cols : [
      { id : 'name', label : 'Name', type : 'string' },
      { id : 'value', label : 'Value', type : 'number' }
    ]
  });

  table.addRows( data );
  table2.addRows( data2 );

  var chartContainer = $(chartSelector)[0];
  var chartContainer2 = $(chartSelector2)[0];

  var chart = new google.visualization.PieChart(chartContainer);
  var chart2 = new google.visualization.PieChart(chartContainer2);

  chart.draw(table, { title : '오늘 (Today)' });
  chart2.draw(table2, { title : '총합계 (Total)' });

  var svg = $('svg', chartContainer );
  var svg2 = $('svg2', chartContainer2 );

  $(labelSelector, svg).each(function (i, v) {
    var total = table.getValue(i, 1);

    var newLabel = $(this).text() + '(' + total + ')';

    $(this).text( newLabel );
  });

  $(labelSelector2, svg2).each(function (i, v) {
    var total2 = table2.getValue(i, 1);

    var newLabel2 = $(this).text() + '(' + total2 + ')';

    $(this).text( newLabel2 );
  });
});

Chart.defaults.global = {
  animation: true,
  animationSteps: 60,
  animationEasing: "easeOutBack",
  showScale: true,
  scaleOverride: false,
  scaleSteps: null,
  scaleStepWidth: null,
  scaleStartValue: null,
  scaleLineColor: "rgba(0,0,0,.1)",
  scaleLineWidth: 1,
  scaleShowLabels: true,
  scaleLabel: "<%=value%>",
  scaleIntegersOnly: true,
  scaleBeginAtZero: false,
  scaleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
  scaleFontSize: 12,
  scaleFontStyle: "normal",
  scaleFontColor: "#666",
  responsive: true,
  maintainAspectRatio: true,
  showTooltips: true,
  customTooltips: false,
  tooltipEvents: ["mousemove", "touchstart", "touchmove"],
  tooltipFillColor: "rgba(0,0,0,0.8)",
  tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
  tooltipFontSize: 14,
  tooltipFontStyle: "normal",
  tooltipFontColor: "#fff",
  tooltipTitleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
  tooltipTitleFontSize: 14,
  tooltipTitleFontStyle: "bold",
  tooltipTitleFontColor: "#fff",
  tooltipYPadding: 6,
  tooltipXPadding: 6,
  tooltipCaretSize: 8,
  tooltipCornerRadius: 6,
  tooltipXOffset: 10,
  tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
  multiTooltipTemplate: "<%= value %>",
  onAnimationProgress: function() {},
  onAnimationComplete: function() {}
};

// BEGIN LINE CHART ============================================

var lineGraphData = {
  labels: ["2020-10-18 19:55", "시험 난이도", "2020-10-23 11:39", "2020-10-27 11:33", "2020-10-27 12:02"],
  datasets: [{
    label: "My First dataset",
    fillColor: "rgba(159, 131, 201,0.2)",
    strokeColor: "rgba(159, 131, 201,1)",
    pointColor: "rgba(159, 131, 201,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(159, 131, 201,1)",
    data: [20, 60, 0, 0, 30]
  }, {
    label: "My Second dataset",
    fillColor: "rgba(180, 180, 180,0.2)",
    strokeColor: "rgba(180, 180, 180,1)",
    pointColor: "rgba(180, 180, 180,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(180, 180, 180,1)",
    data: [30, 50, 60, 50, 10]
  }]
};
var lineGraphOptions = {
  scaleShowGridLines: true,
  scaleGridLineColor: "rgba(0,0,0,.05)",
  scaleGridLineWidth: 1,
  scaleShowHorizontalLines: true,
  scaleShowVerticalLines: true,
  bezierCurve: true,
  bezierCurveTension: 0.4,
  pointDot: true,
  pointDotRadius: 4,
  pointDotStrokeWidth: 1,
  pointHitDetectionRadius: 20,
  datasetStroke: true,
  datasetStrokeWidth: 2,
  datasetFill: true,
  legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
};
var lineCtx = document.getElementById("myGraph").getContext("2d");
var myLineChart = new Chart(lineCtx).Line(lineGraphData, lineGraphOptions);


var officeVM = new Vue({
  el: '#list',
  data: {
    problem: [
      { number: '2020-10-23 11:39', go: false },
      { number: '2020-10-27 11:33', go: false },
    ]
  },
  computed:{
    problem2: function(){
      var _problem = [];
      for (var i=0, problem; problem = this.problem[i]; i++){
        problem.go = false;
        _problem.push(problem);
      }
      return _problem;
    }
  },
})
function goProblem() {
  location.href="";
}