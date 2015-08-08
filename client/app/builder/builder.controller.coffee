'use strict'

( ->
	angular
		.module 'slidiApp'
		.controller 'BuilderCtrl', ($scope, $modal, Auth, $http, $rootScope, User) ->
			$scope.presentation = 
				_id: 1
				title: '(1)Title'
				format: 'square-format'
				tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
				slides: [
					items: ['<div style="position:absolute;left:300px;"><h1>Hello</h1></div>', '<img style="position:absolute;left:270px;top:200px;" src="http://res.cloudinary.com/vkhrapski/image/upload/v1438934517/tqdknvgjo7okb1bof78r.jpg">']
				,
					items: ['<div style="position:absolute;left:150px;">(2-1)Hello</div>']
				,
					items: ['<div style="position:absolute;left:150px;">(3-1)Hello</div>']
		  	]

			$scope.currentSlide = $scope.presentation.slides[0]

			$scope.addItem = (item) ->
				$scope.currentSlide.items.push item

			$scope.setCurrentSlide = (index) ->
				$scope.currentSlide = $scope.presentation.slides[index]
			
			$scope.addText = () ->
				$scope.addItem '<ng-video-preview source="youtube" url="http://youtu.be/VEUfscdqpNg"></ng-video-preview>'#'<div style="position:absolute;left:365px;top:275px;">Text</div>'
			
			$scope.addPicture = (url) ->
				$scope.addItem '<img style="position:absolute;left:100px;top:200px;" src="' + url + '">'
			
			$scope.addVideo = (link) ->
				$scope.addItem '<iframe type="text/html" width="300" height="200" src="https://www.youtube.com/embed/' + link + '"/>'

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

