'use strict'
(->
	PresentationService = (Auth, User, $http) ->
		user = Auth.getCurrentUser()
		presentations =	[ #user.presentations
				title: '(1)Title'
				format: 'square-format'
				tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
			,
				title: '(2)Title'
				format: 'square-format'
				tags: ['(2-1)Tag', '(2-2)Tag', '(2-3)Tag', '(2-4)Tag']
			]
		emptyPresentation = 
			title: 'Title'
			tags: ['tag']
			slides: [
				text: [
					style: 'position:absolute;left:300px;'
					content: 'Hello'
				]
				pictures: [
					style: 'position:absolute;left:270px;top:200px;'
					content:	'tqdknvgjo7okb1bof78r'
				]
				videos: []
				shapes: []
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


	PresentationService
		.$inject = ['Auth','User', '$http']
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()