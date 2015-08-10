'use strict'
(->
	SlideService = (PresentationService) ->
		
		presentation = PresentationService.get(0)
		emptySlide = 
			text: []
			pictures: [
					style: 'position:absolute;left:320px;top:200px;'
					content:	'logo-yeoman.png'
				]
			videos: []
			shapes: []

		getCurrentPresentation: () -> 
			presentation

		list: () ->
			presentation.slides

		addText: (slide, text) ->
			slide.text.push
					style: 'position:absolute;'
					content: text
					rect:  {
          	height: null
          	transform: 'matrix(1, 0, 0, 1, 0, 0)'
          	width: null
          	top: '0'
						left: '0'
        	}

		addPicture: (slide, url) ->
			slide.pictures.push
				style: "position: absolute"
				content: url

		addVideo: (slide, url) ->
			slide.videos.push(
				content: url
			)

		addShape: (slide) ->
			slide.shapes.push(
				style: 'position:absolute; width: 400px; height: 300px;border: 2px solid #4393B9;background-color: grey;'
			)

		addBefore: (index) ->
			presentation.slides.splice(index, 0, emptySlide)

		addLast: ()->
			presentation.slides.push(emptySlide)

		delete: (index) ->
			presentation.slides.splice(index, 1)

	SlideService
		.$inject = ['PresentationService']
	angular
		.module('slidiApp')
		.factory('SlideService', SlideService)
)()