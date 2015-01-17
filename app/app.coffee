'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'classy'
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

    .when('/indices', {templateUrl: 'app/partials/indicies.jade'})
    .when('/about', {templateUrl: 'app/partials/about.jade'})

    # Catch all
    .otherwise({redirectTo: '/indices'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
