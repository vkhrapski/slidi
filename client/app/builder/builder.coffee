'use strict'

angular.module 'slidiApp'
.config ($stateProvider) ->
  $stateProvider.state 'builder',
    url: '/builder'
    templateUrl: 'app/builder/builder.html'
    controller: 'BuilderCtrl'
