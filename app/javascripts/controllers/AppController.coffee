App.classy.controller

  name: 'AppCtrl'

  inject: ['$scope', '$location', '$resource', '$rootScope']

  init: ->
    @$.location = @$location

  watch:
    'location.path()': (path) ->
      @$.activeNavId = path || '/'

  getClass: (id) ->
    if @$.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''