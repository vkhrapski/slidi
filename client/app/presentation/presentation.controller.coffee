'use strict'
(->
	angular.module('slidiApp')
	.controller 'PresentationCtrl', ($scope, $location, Auth, PresentationService, TagService) ->
		$scope.presentations = PresentationService.list()

		$scope.openBuilder = (presentation) ->
			$location.path('builder')
		
		$scope.create = () ->
			PresentationService.create()
					
		$scope.delete = (index) ->
			PresentationService.delete(index)
		
		$scope.update = (presentation) ->

		$scope.addTag = (presentation) -> 
			PresentationService.addTag(presentation)
		
		$scope.deleteTag = (presentation, index) ->
			PresentationService.deleteTag(presentation, index)
		
		$scope.isLoggedIn = () -> 
			Auth.isLoggedIn()

		$scope.words = TagService.list()
)()