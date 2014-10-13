angular.module('MediaDashboardApp')
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
