angular.module('JukeBoxApp')
.factory('Library', [ '$resource', 'API_ENDPOINT', function($resource, API_ENDPOINT) {
  var api = $resource(API_ENDPOINT, {}, {
    get: { method: 'get', url: API_ENDPOINT + 'library/collection', params: {} }
  });

  return api;
}]);
