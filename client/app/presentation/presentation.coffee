'use strict'

angular.module 'slidiApp'
.config ($stateProvider) ->
  $stateProvider.state 'presentation',
    url: '/'
    templateUrl: 'app/presentation/presentation.html'
    controller: 'PresentationCtrl'
