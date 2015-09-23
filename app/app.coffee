'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'classy'
  'firebase'
  'app.directives'
  'app.filters'
  'app.services'
  'app.templates'
])

# Routes
App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider
    .when('/about', {templateUrl: 'app/partials/about.jade'})
    .when('/read', {templateUrl: 'app/partials/read.jade'})
    .when('/write', {templateUrl: 'app/partials/write.jade'})
    .when('/read/:indexId', {
      templateUrl: 'app/partials/read-detail.jade'
    })
    .when('/write/:indexId', {
      templateUrl: 'app/partials/write-detail.jade'
    })
    # Catch all
    .otherwise({redirectTo: '/about'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
