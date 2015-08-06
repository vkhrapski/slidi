'use strict'

angular.module 'slidiApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'angular-cloudinary',
  'ngVideoPreview'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider, cloudinaryProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
  $httpProvider.interceptors.push 'authInterceptor'
  cloudinaryProvider.config
    cloud_name: 'vkhrapski'
    upload_preset: 'qiorzz9s'

.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
  # Add authorization token to headers
  request: (config) ->
    config.headers = config.headers or {}
    if $cookieStore.get('token') and config.url.indexOf('api.cloudinary.com') == -1
      config.headers.Authorization = 'Bearer ' + $cookieStore.get('token')
    config

  # Intercept 401s and redirect you to login
  responseError: (response) ->
    if response.status is 401
      $location.path '/login'
      # remove any stale tokens
      $cookieStore.remove 'token'

    $q.reject response

.run ($rootScope, $location, Auth) ->
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', (event, next) ->
    Auth.isLoggedInAsync (loggedIn) ->
      $location.path "/login" if next.authenticate and not loggedIn
