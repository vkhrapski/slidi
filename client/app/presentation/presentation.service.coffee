'use strict'
(->
	PresentationService = () ->
		#currentUser = Auth.getCurrentUser
		presentations =	[
    	_id: 1
	    title: '(1)Title'
	    tags: ['(1-1)Tag', '(1-2)Tag']
	    slides: ['<h1>(1-1)Hello</h1>', '<h1>(1-2)Hello</h1>', '<h1>(1-3)Hello</h1>']
	  , 
    	_id: 2
	    title: '(2)Title'
	    tags: ['(2-1)Tag', '(2-2)Tag']
	    slides: ['<h1>(2-1)Hello</h1>', '<h1>(2-2)Hello</h1>', '<h1>(2-3)Hello</h1>']
	  ]
		
		list: () ->
			presentations
		create: (callback) ->
			presentations.push
				_id: Math.floor(Math.random() * 1000)
				title: 'Title'
				tags: []
				slides: []
		delete: (id) ->
			presentations = presentations.filter(id) -> presentation._id isnt id
		update: (presentation) ->


	PresentationService
		.$inject = []
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()