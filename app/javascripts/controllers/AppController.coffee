App.classy.controller

  name: 'AppCtrl'

  inject: ['$scope', '$location', '$resource', '$rootScope']

  init: ->
    @$.location = @$location
    @$.activeNavId = "indices"

  watch:
    'location.path()': (path) ->
      @$.activeNavId = path || '/'

  getClass: (id) ->
    if @$.activeNavId == id
      return 'active'
    else
      return ''