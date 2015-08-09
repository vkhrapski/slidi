'use strict'
(->
	PresentationService = () ->
		#currentUser = Auth.getCurrentUser
		presentations =	[
      _id: 1
      title: '(1)Title'
      format: 'square-format'
      tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
      slides: []
		, 
			_id: 2
			title: '(1)Title'
			format: 'square-format'
			tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
			slides: []
  	]
		list: () ->
			presentations
		create: () ->
			presentations.push(
				_id: Math.floor(Math.random() * 1000)
				title: 'Title'
				tags: ['tag']
				slides: []
			)
		delete: (index) ->
			presentations.splice index, 1
		update: (presentation) ->

		addTag: (presentation) ->
			presentation.tags.push 'New tag'

		deleteTag: (presentation, index) ->
			presentation.tags.splice index, 1


	PresentationService
		.$inject = []
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()