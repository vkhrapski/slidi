'use strict'
(->
	TagService = () ->
		list: () ->
			[
				{ text:'love', weight: Math.floor(Math.random() * 10) + 1 }, { text:'tweegram', weight: Math.floor(Math.random() * 10) + 1 }, 
				{ text:'photooftheday', weight: Math.floor(Math.random() * 10) + 1 }, { text:'amazing', weight: Math.floor(Math.random() * 10) + 1 },
				{ text:'igers', weight: Math.floor(Math.random() * 10) + 1 }, { text:'picoftheday', weight: Math.floor(Math.random() * 10) + 1 },
				{ text:'food', weight: Math.floor(Math.random() * 10) + 1 }, { text:'instadaily', weight: Math.floor(Math.random() * 10) + 1 },
				{ text:'bestoftheday', weight: Math.floor(Math.random() * 10) + 1 }, { text:'instacool', weight: Math.floor(Math.random() * 10) + 1 },
				{ text:'instago', weight: Math.floor(Math.random() * 10) + 1 }, { text:'all_shots', weight: Math.floor(Math.random() * 10) + 1 }
	 		]


	TagService
		.$inject = []
	angular
		.module('slidiApp')
		.factory('TagService', TagService)
)()