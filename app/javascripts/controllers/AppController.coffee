App.classy.controller

  name: 'AppCtrl'

  inject: ['$scope', '$location', '$resource', '$rootScope']

  init: ->
    @$.location = @$location
    @$.activeNavId = "indices"
    @$.indexPanelActive = false
    @$.itemPanelActive = false

  watch:
    'location.path()': (path) ->
      @$.activeNavId = path || '/'

  getClass: (id) ->
    if @$.activeNavId == id
      return 'active'
    else
      return ''

  setIndexPanelActive: ->
    @$.indexPanelActive = true

  setIndexPanelInactive: ->
    @$.indexPanelActive = false

  setItemPanelActive: ->
    @$.itemPanelActive = true

  setItemPanelInactive: ->
    @$.itemPanelActive = false