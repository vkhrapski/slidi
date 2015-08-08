'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, Auth, $http, $rootScope, User) ->
			$scope.rect = 
					'"width":"1000px",
          "height":"1000px",
          "top":"0px",
          "left":"0px"'
			$scope.presentation = 
				_id: 1
				title: '(1)Title'
				format: 'square-format'
				tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
				slides: [
					text: [
						style: 'position:absolute;left:300px;'
						content: 'Hello'
					]
					pictures: [
						style: 'position:absolute;left:270px;top:200px;'
						content:	'tqdknvgjo7okb1bof78r'
					]
					videos: [
					]
					shapes: [
					]
				,
					text: [
					]
					pictures: [
					]
					videos: [
						style: ''
						content: 'https://www.youtube.com/watch?v=bPH9L8jl68Q'
					]
					shapes: [
					]
				,
					text: [
					]
					pictures: [
						style: 'position:absolute;left:270px;top:200px;'
						content:	'http://res.cloudinary.com/vkhrapski/image/upload/v1438934517/tqdknvgjo7okb1bof78r.jpg'
					]
					videos: [
					]
					shapes: [
					]
		  	]

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

