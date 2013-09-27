var map = angular.module('map', [])

map.directive('map', function() {
  return {
    restrict: 'E',
    controller: function($scope) {
      this.map = {};
    },
    link: function(scope, element, attrs, controller) {
      
      var defaults = {
        center: typeof attrs.center !== 'undefined' ? JSON.parse(attrs.center) : null,
        zoom: attrs.zoom || null
      }
      
      controller.map = new esri.Map(element[0], defaults);
      
      scope.$on('sezione', function(event, e) {
        console.log("Cambio sezione: " + e.sezione);
      });
      
      controller.map.on('click', function(event) {
      
      });
      
    }
  }
});

map.directive('tiledLayer', function() {
  return {
    restrict: 'E',
    require: '^map',
    scope: false,
    link: function(scope, element, attrs, mapCtrl) {
      scope.$watch(mapCtrl.map, function() {
        mapCtrl.map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer(attrs.url));
      })      
    }
  }
});

map.directive('dynamicLayer', function() {
  return {
    restrict: 'E',
    require: '^map',
    scope: false,
    link: function(scope, element, attrs, mapCtrl) {
      scope.$watch(mapCtrl.map, function() {
        mapCtrl.map.addLayer(new esri.layers.ArcGISDynamicMapServiceLayer(attrs.url));
      })
    }
  }
});

map.directive('featureLayer', function() {
  return {
    restrict: 'E',
    require: '^map',
    scope: false,
    link: function(scope, element, attrs, mapCtrl) {
      scope.$watch(mapCtrl.map, function() {
        var featureLayer = new esri.layers.FeatureLayer(attrs.url, { mode: esri.layers.FeatureLayer.MODE_ONDEMAND, outFields: "*" })
        featureLayer.on('click', function(event) {
          console.log(event.graphic.attributes.NOME_QUARTIERE);
          scope.$broadcast('sezione', { sezione: event.graphic.attributes.NOME_QUARTIERE })
        });
        mapCtrl.map.addLayer(featureLayer);
      })
    }
  }
});
