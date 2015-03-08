$( document ).ready(function(){

  var surveyId = $( '#survey-container' ).data('survey');

  Funct.surveyStatsAjax(surveyId);

});



var Funct = {
	getTarget: function(e){
		e.preventDefault();

  	$target = e.target;
	},
	surveyNavActive: function(){
  	$target.addClass('active');
  },
  surveyStatsAjax: function(survey_id){
  	$.ajax({
  		url: '/surveys/results.json',
  		type: 'get',
      data: {survey_id: survey_id},
      success: function(result) {
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
    // new Chartist.Pie('.ct_chart', settings.data, settings.options, settings.responsiveOptions);
    new Chartist.Pie('#question_' + question_id, settings.data, settings.options, settings.responsiveOptions);
  },
  labelPie: function(question_stats) {
    console.log('in labelPie function');
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
      labelInterpolationFnc: function(value) {
        return value[0];
      }
    }

    var responsiveOptions = [
      ['screen and (min-width: 640px)', {
        chartPadding: 30,
        labelOffset: 120,
        labelDirection: 'explode',
        labelInterpolationFnc: function(value) {
          return value;
        }
      }],
      ['screen and (min-width: 1024px)', {
        labelOffset: 80,
        chartPadding: 20
      }]
    ];
    console.log(data);
    console.log(options);
    console.log(responsiveOptions);
    return {
      data: data,
      options: options,
      responsiveOptions: responsiveOptions
    };
  }
};
