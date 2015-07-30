'use strict'

describe 'Controller: PresentationCtrl', ->

  # load the controller's module
  beforeEach module 'slidiApp'
  PresentationCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PresentationCtrl = $controller 'PresentationCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
