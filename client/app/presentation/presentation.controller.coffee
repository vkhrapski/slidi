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
			PresentationService.delete index
		
		$scope.update = (presentation) ->
			$scope.presentation.title = 'Updated'
		
		$scope.addTag = (presentation) -> 
			PresentationService.addTag(presentation)
		
		$scope.deleteTag = (presentation, index) ->
			PresentationService.deleteTag presentation, index
		
		$scope.isLoggedIn = () -> 
			Auth.isLoggedIn()

		words = TagService.list()
		$('#tags').jQCloud(words, 
			width: 600
			height: 250
		)
)()