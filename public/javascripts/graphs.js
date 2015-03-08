$( document ).ready(function(){

  var surveyId = $( '#survey-container' ).data('survey');

  Funct.surveyStatsAjax(surveyId);

  $( '.survey-selector' ).on( 'click', function(e){
    e.preventDefault();

    var $target = e.target;
    var $data = $(this).data();

    Funct.updateSurveyStats($target, $data);
  });

});



var Funct = {
	getTarget: function(e){
		e.preventDefault();

  	var $target = e.target;
    return $target;
	},
  getData: function(target){
    var $data = target.data();
    return $data;
  },
	surveyNavActive: function(){
    $( '.survey-selector' ).removeClass( 'active' );
    $(this).addClass('active');
  },
  updateSurveyStats: function(target, data){
    Funct.surveyNavActive(target);
    Funct.surveyStatsAjax(data['surveyId']);
  },
  surveyStatsAjax: function(survey_id){
  	$.ajax({
  		url: '/surveys/results.json',
  		type: 'get',
      data: {survey_id: survey_id},
      success: function(result) {
        console.log(result);
        for (var question in result) {
          if (result.hasOwnProperty(question)) {
            Graph.generateGraph(result[question], question);
          }
        }
      }
  	});
  }
};
  
var Graph = {
  generateGraph: function(question_stats, question_id) {
    var settings = Graph.labelPie(question_stats);
    new Chartist.Pie('#question_' + question_id, settings.data, settings.options);
  },
  labelPie: function(question_stats) {
    var data = {
      labels: [],
      series: []
    };

    for (var choice in question_stats) {
      if (question_stats.hasOwnProperty(choice)) {
        data.labels.push(choice);
        data.series.push(question_stats[choice]);        
      }
    }

    var options = {
      width: 300,
      height: 300,
      labelOffset: 0,
      labelInterpolationFnc: function(value) {
        return value[0];
      }
    }
    return {
      data: data,
      options: options
    };
  }
};
