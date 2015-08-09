'use strict'
(->
	PresentationService = (Auth) ->
		user = Auth.getCurrentUser()
		presentations =	user.presentations
		list: () ->
			presentations
		create: () ->
			presentations.push(
				_id: Math.floor(Math.random() * 1000)
				title: 'Title'
				tags: ['tag']
				slides: [
					
				]
			)
		delete: (index) ->
			presentations.splice index, 1
		update: (presentation) ->

		addTag: (presentation) ->
			presentation.tags.push 'New tag'

		deleteTag: (presentation, index) ->
			presentation.tags.splice index, 1


	PresentationService
		.$inject = ['Auth']
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()