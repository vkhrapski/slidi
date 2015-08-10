'use strict'
(->
	PresentationService = (Auth, User, $http) ->
		emptyPresentation = 
			title: 'Title'
			tags: ['tag']
			slides: [
				text: [
					style: 'position:absolute;left:150px;'
					content: 'Hello'
					rect:  {
          	height: '20px'
          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
          	width: '100px'
          	top: '0'
						left: '0'
        	}
				]
				pictures: [
					style: 'position:absolute;left:270px;top:200px;'
					content:	'tqdknvgjo7okb1bof78r'
				]
				videos: []
				shapes: []
			]
		user = Auth.getCurrentUser()
		presentations =	[ #user.presentations
				title: '(1)Title'
				format: 'square-format'
				tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
				slides: [
					text: [
						style: 'position:absolute;left:300px;'
						content: 'Hello'
						rect:  {
	          	height: '50px'
	          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
	          	width: '100px'
	          	top: '0'
							left: '0'
	        	}
					]
					pictures: [
						style: 'position:absolute;'
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
			,
				title: '(2)Title'
				format: 'square-format'
				tags: ['(2-1)Tag', '(2-2)Tag', '(2-3)Tag', '(2-4)Tag']
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
			]
		list: () ->
			presentations
		create: () ->
			presentations.push(emptyPresentation)
			###$http
				.post('/api/presentations/', emptyPresentation)
				.success((presentation, status, headers, config) ->
					User
						.addPresentation(
							userId: user._id, 
							presentationId: presentation._id
						)
						.$promise.then(
							(user)->
								presentations = user.presentations
						)
				)###
				
		delete: (index) ->
			presentations.splice index, 1
			
		addTag: (presentation) ->
			presentation.tags.push 'New tag'

		deleteTag: (presentation, index) ->
			presentation.tags.splice index, 1

		get: (index) ->
			presentations[index]
			
	PresentationService
		.$inject = ['Auth','User', '$http']
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()