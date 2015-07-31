'use strict'
(->
	PresentationCtrl = ($scope, PresentationSevice)->
	  $scope.presentations = getPresentations()

	  $scope.create = () ->
	  	PresentationSevice.create()
	  
	  $scope.getPresentations = () ->
	  	PresentationSevice.list()
		
	  $scope.delete = (id) ->
	    PresentationSevice.delete(id)
		
	  $scope.update = (id) ->
	    PresentationSevice.update(id)
	
  PresentationCtrl
  	.$inject = ['$scope', 'PresentationSevice']
	angular
		.module('slidiApp')
		.controller('PresentationCtrl', PresentationCtrl)
)()