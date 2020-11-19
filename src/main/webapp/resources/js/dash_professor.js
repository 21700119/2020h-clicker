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

// BEGIN BAR CHART ============================================

var barData = {
  labels: ["2020-10-17 17:42", "스터디모임시간", "ch4 이해?"],
  datasets: [{
    label: "My dataset",
    fillColor: "rgba(159, 131, 201,0.5)",
    strokeColor: "rgba(159, 131, 201,0.8)",
    highlightFill: "rgba(159, 131, 201,0.75)",
    highlightStroke: "rgba(159, 131, 201,1)",
    data: [2, 2, 0]
  }]
};
var barOptions = {
  scaleBeginAtZero: true,
  scaleShowGridLines: true,
  scaleGridLineColor: "rgba(0,0,0,.05)",
  scaleGridLineWidth: 1,
  scaleShowHorizontalLines: true,
  scaleShowVerticalLines: true,
  barShowStroke: true,
  barStrokeWidth: 2,
  barValueSpacing: 5,
  barDatasetSpacing: 1,
  legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
};

var barCtx = document.getElementById("myBarGraph").getContext("2d");
var myBarChart = new Chart(barCtx).Bar(barData, barOptions);


// BEGIN LINE CHART ============================================

var lineGraphData = {
  labels: ["2020-10-17 17:42", "스터디모임시간", "ch4 이해?"],
  datasets: [{
    label: "My First dataset",
    fillColor: "rgba(159, 131, 201,0.2)",
    strokeColor: "rgba(159, 131, 201,1)",
    pointColor: "rgba(159, 131, 201,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(159, 131, 201,1)",
    data: [30, 90, 0]
  }, {
    label: "My Second dataset",
    fillColor: "rgba(138, 138, 138,0.2)",
    strokeColor: "rgba(138, 138, 138,1)",
    pointColor: "rgba(138, 138, 138,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(138, 138, 138,1)",
    data: [30, 45, 0]
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