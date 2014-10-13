angular.module('JukeBoxApp', ['ngResource']);

angular.module('JukeBoxApp').constant('API_ENDPOINT', 'http://33.33.33.25:9292/api/');


angular.module('JukeBoxApp')
.factory('Library', [ '$resource', 'API_ENDPOINT', function($resource, API_ENDPOINT) {
  var api = $resource(API_ENDPOINT, {}, {
    get: { method: 'get', url: API_ENDPOINT + 'library/collection', params: {} }
  });

  return api;
}]);


angular.module('JukeBoxApp')
.controller('MainController', [
  '$scope',
  '$http',
  'Library',
  'JukeBox',
  function( $scope, $http, Library, JukeBox ) {

    $scope.currentSong = { name: '', path: '' };

    Library.get().$promise.then( function( response ) {
      $scope.library = response;
      console.log($scope.library);
    });

    $scope.nextSong = function() {
      JukeBox.removeFromQueue( $scope.currentSong );
      $scope.currentSong = JukeBox.NextSong();
    };

    $scope.addToQueue = function( song ) {
      JukeBox.addToQueue( song );
    };
  }
]);


angular.module('JukeBoxApp')
.service('JukeBox', [ function() {

  this.songQueue = [];

  this.nextSong = function( song ) {
    return this.songQueue[0];
  };

  this.addToQueue = function( song ) {
    this.songQueue.push( song );
    return this.songQueue.length;
  };

  this.removeFromQueue = function( index ) {
    this.songQueue.splice( index, 1 );
  };

}]);
