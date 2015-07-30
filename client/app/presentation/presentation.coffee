'use strict'

angular.module 'slidiApp'
.config ($stateProvider) ->
  $stateProvider.state 'presentation',
    url: '/presentation'
    templateUrl: 'app/presentation/presentation.html'
    controller: 'PresentationCtrl'
