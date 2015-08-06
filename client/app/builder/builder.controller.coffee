'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, Auth, $http, $rootScope) ->
			$scope.presentation = 
				_id: 1
				title: '(1)Title'
				format: 'square-format'
				tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
				slides: [
					items: ['<div style="position:absolute;left:150px;">(1-1)Hello</div>', '<div style="position:absolute;left: 150px;top: 100px;">(1-2)Hello</div>']
				,
					items: ['<div style="position:absolute;left:150px;">(2-1)Hello</div>', '<div style="position:absolute;left: 150px;top: 100px;">(2-2)Hello</div>']
				,
					items: ['<div style="position:absolute;left:150px;">(3-1)Hello</div>', '<div style="position:absolute;left: 150px;top: 100px;">(3-2)Hello</div>']
		  	]

			$scope.currentSlide = $scope.presentation.slides[0]

			$scope.setCurrentSlide = (index) ->
				$scope.currentSlide = $scope.presentation.slides[index]
			
			$scope.addText = () ->
				$scope.currentSlide.items.push '<div style="position:absolute;left:365px;top:275px;">Text</div>'
			
			$scope.addVideo = (link) ->
				$scope.currentSlide.items.push '<iframe type="text/html" width="540" height="390" src="https://www.youtube.com/embed/' + link + '"/>'

			$scope.openPictureRepo = () ->
				pictureModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'picture-repository.html',
					controller: 'PictureRepositoryCtrl'
			
			$scope.openYoutubeModal = () ->
				youtubeModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'youtube.html',
					controller: 'YoutubeModalCtrl'
				youtubeModal.result
					.then (link) ->
						$scope.addVideo link
)()

(->
	angular
		.module 'slidiApp'
		.filter 'html', ($sce) ->
			(html) ->
				$sce.trustAsHtml html
)()

