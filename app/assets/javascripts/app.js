var app = angular.module('mapApp', ['map', 'googlechart']);

app.config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);

app.controller('FirstChartCtrl', function($scope, $http) {

  $scope.chart = {
    "type": "AreaChart",
    "displayed": true,
    "cssStyle": "height:400px; width:100%;",
    "options": {
      "title": "Popolazione per anno",
      "isStacked": "true",
      "fill": 20,
      "displayExactValues": true,
      "vAxis": {
        "title": "Popolazione",
        "gridlines": {
          "count": 10
        }
      },
      "hAxis": {
        "title": "Anno"
      }
    },
    "formatters": {}
  }
  
  $http.get('http://pws0000461.lugano.ch:3131/demographics?indicator[method]=total_by_year_quartiere&indicator[quartiere_id]=1&indicator[from]=1999&indicator[to]=2012').success(function(data) {
    $scope.chart.data = data;
  });
  
});

app.controller('SecondChartCtrl', function($scope, $http) {
  
  $scope.chart = {
    "type": "BarChart",
    "displayed": true,
    "cssStyle": "height:600px; width:100%;",
    "options": {
      "title": "Popolazione per quartiere",
      "isStacked": "true",
      "fill": 20,
      "displayExactValues": true,
      "vAxis": {
        "title": "Popolazione",
        "gridlines": {
          "count": 10
        }
      },
      "hAxis": {
        "title": "Anno"
      }
    },
    "formatters": {}
  }
  
  $http.get('http://pws0000461.lugano.ch:3131/demographics?indicator[method]=totale_quartieri_anno&indicator[year]=2012').success(function(data) {
    $scope.chart.data = data;
  });
  
});
