'use strict'

describe 'Controller: BuilderCtrl', ->

  # load the controller's module
  beforeEach module 'slidiApp'
  BuilderCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BuilderCtrl = $controller 'BuilderCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
