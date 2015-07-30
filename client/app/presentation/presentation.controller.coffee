'use strict'

angular.module 'slidiApp'
.controller 'PresentationCtrl', ($scope, User) ->
  $scope.presentations = ->
  	User.getCurrentUser().presentations.slides