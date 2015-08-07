'use strict'

angular.module 'slidiApp'
.factory 'User', ($resource) ->
  $resource '/api/users/:id/:controller',
    id: '@_id'
  ,
    changePassword:
      method: 'PUT'
      params:
        controller: 'password'

    get:
      method: 'GET'
      params:
        id: 'me'

    getPictures:
      method: 'GET'
      params:
        id: 'me'
        controller: 'pictures'


