'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, PresentationService, SlideService) ->
			
			$scope.presentation = SlideService.getCurrentPresentation()

			$scope.currentSlide = $scope.presentation.slides[0]

			$scope.setCurrentSlide = (index) ->
				$scope.currentSlide = $scope.presentation.slides[index] 
			
			$scope.addText = (slide, text) ->
				SlideService.addText(slide, text)
			
			$scope.addPicture = (slide, url) ->
				SlideService.addPicture(slide, url)
			
			$scope.addVideo = (slide, link) ->
				SlideService.addVideo(slide, link)

			$scope.addShape = () ->
				SlideService.addShape($scope.currentSlide)
			
			$scope.save = () ->


			$scope.openTextModal = () ->
				pictureModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'text-modal.html',
					controller: 'TextModalCtrl'
				pictureModal.result
					.then (text) ->
						$scope.addText($scope.currentSlide, text)

			$scope.openPictureModal = () ->
				pictureModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'picture-modal.html',
					controller: 'PictureModalCtrl'
				pictureModal.result
					.then (url) ->
						$scope.addPicture($scope.currentSlide, url)
			
			$scope.openYoutubeModal = () ->
				youtubeModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'youtube-modal.html',
					controller: 'YoutubeModalCtrl'
				youtubeModal.result
					.then (link) ->
						$scope.addVideo($scope.currentSlide, link)

			$scope.changeFormat = () ->
				format = $scope.presentation.format 
				sq = 'square-format'
				rect = 'rectangle-format'
				$scope.presentation.format = rect if format == sq
				$scope.presentation.format = sq if format == rect
)()
