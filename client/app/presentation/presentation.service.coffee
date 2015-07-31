'use strict'
(->
	PresentationService = ($http, Auth) ->
		currentUser = Auth.getCurrentUser
			
		list: () ->
			currentUser.presentations
		create: (callback) ->
			$http.post '/api/presentations/'
			.success (presentation) ->
				presentationId = presentation._id
				callback?()
			.error (error) ->
				callback? err
		delete: (id) ->
		update: (id) ->

	PresentationService
		.$inject = ['$http', 'Auth']
	angular
		.module('slidiApp')
		.factory('PresentationService', PresentationService)
)()