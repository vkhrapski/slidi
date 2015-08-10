'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, PresentationService) ->
			
			$scope.presentation = PresentationService.get(0)

			$scope.currentSlide = $scope.presentation.slides[0]

			$scope.setCurrentSlide = (index) ->
				$scope.currentSlide = $scope.presentation.slides[index] 
			
			$scope.addText = (text) ->
				$scope.currentSlide.text.push
					style: 'position:absolute;'
					content: text
					rect:  {
          	height: null
          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
          	width: null
          	top: '0'
						left: '0'
        	}
			
			$scope.addPicture = (url) ->
				$scope.currentSlide.pictures.push
					style: 'position:absolute;'
					content: url
					rect:  {
          	height: '0'
          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
          	width: '0'
          	top: '0'
						left: '0'
        	}
			
			$scope.addVideo = (link) ->
				$scope.currentSlide.videos.push
					style: ''
					content: link
					rect:  {
          	height: '0'
          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
          	width: '0'
          	top: '0'
						left: '0'
        	}

			$scope.openTextModal = () ->
				pictureModal = $modal.open
					animation: $scope.animationsEnabled,
					templateUrl: 'text-modal.html',
					controller: 'TextModalCtrl'
				pictureModal.result
					.then (text) ->
						$scope.addText text

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

