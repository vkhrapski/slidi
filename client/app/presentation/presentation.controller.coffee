'use strict'
(->
	angular.module('slidiApp')
	.controller 'PresentationCtrl', ($scope, $location) ->
	  $scope.presentations = [
    	_id: 1
	    title: '(1)Title'
	    tags: ['(1-1)Tag', '(1-2)Tag', '(1-3)Tag', '(1-4)Tag']
	    slides: ['<h1>(1-1)Hello</h1>', '<h1>(1-2)Hello</h1>', '<h1>(1-3)Hello</h1>']
	  , 
    	_id: 2
	    title: '(2)Title'
	    tags: ['(2-1)Tag', '(2-2)Tag', '(2-3)Tag']
	    slides: ['<h1>(2-1)Hello</h1>', '<h1>(2-2)Hello</h1>', '<h1>(2-3)Hello</h1>']
    ,
    	_id: 3
	    title: '(3)Title'
	    tags: ['(3-1)Tag', '(3-2)Tag']
	    slides: ['<h1>(3-1)Hello</h1>', '<h1>(3-2)Hello</h1>', '<h1>(3-3)Hello</h1>']
    ,
    	_id: 4
	    title: '(4)Title'
	    tags: ['(4-1)Tag']
	    slides: ['<h1>(4-1)Hello</h1>', '<h1>(4-2)Hello</h1>', '<h1>(4-3)Hello</h1>']		
	  ]
	  $scope.builder = (presentation) ->
	  	$location.path('builder')
	  $scope.create = () ->
	  	$scope.presentations.push
				_id: Math.floor(Math.random() * 1000)
				title: 'Title'
				tags: []
				slides: []
			console.log $scope.presentations
	  		
	  $scope.delete = (id) ->
	    $scope.presentations = $scope.presentations.filter(id) -> presentation._id isnt id
		
	  $scope.update = (presentation) ->
	    $scope.presentation.title = 'Updated'
)()