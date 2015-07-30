'use strict'

angular.module 'slidiApp'
.service 'PresentationService', ($http, Auth)->
	currentUser = Auth.getCurrentUser
		
	list: ->
		currentUser.presentations
	add: (data, callback) ->
		$http.post '/api/presentations/'
		.success (presentation) ->
			presentationId = presentation._id
			callback?()
		.error (error) ->
			callback? err
	delete: (id) ->
	update: (id) ->