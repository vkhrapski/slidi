'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, PresentationService) ->
			
			$scope.presentation = PresentationService.get(0)

			$scope.currentSlide = $scope.presentation.slides[0]

			$scope.setCurrentSlide = (index) ->
				$scope.currentSlide = $scope.presentation.slides[index] 
			
			$scope.addText = () ->
				$scope.currentSlide.text.push
					style: 'position:absolute;top:400px;left:300px;'
					content: 'Hello'
			
			$scope.addPicture = (url) ->
				$scope.currentSlide.pictures.push
					style: 'position:absolute;top:400px;left:300px;'
					content: url
			
			$scope.addVideo = (link) ->
				$scope.currentSlide.videos.push
					style: ''
					content: link

			$scope.openPictureModal = () ->
				pictureModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'picture-modal.html',
					controller: 'PictureModalCtrl'
				pictureModal.result
					.then (url) ->
						$scope.addPicture url
			
			$scope.openYoutubeModal = () ->
				youtubeModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'youtube-modal.html',
					controller: 'YoutubeModalCtrl'
				youtubeModal.result
					.then (link) ->
						$scope.addVideo link

			$scope.changeFormat = () ->
				format = $scope.presentation.format 
				sq = 'square-format'
				rect = 'rectangle-format'
				$scope.presentation.format = rect if format == sq
				$scope.presentation.format = sq if format == rect
)()

(->
	angular
		.module 'slidiApp'
		.filter 'html', ($sce) ->
			(html) ->
				$sce.trustAsHtml html
)()

