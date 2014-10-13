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
