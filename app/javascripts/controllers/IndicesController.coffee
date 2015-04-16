App.classy.controller

  name: 'IndicesCtrl'

  inject: ['$scope', '$http', 'filterFilter']

  init: ->
    @$.indices = []
    @$.activeIndex = null
    @$.sortedActiveIndex = null
    @$.activeItem = null

    @index1 = 
      title: "This is an example title."
      description: "This is the an example description."
      items: []

    @$.indices.push(@index1)

  watch: 
    '{object}indices': '_onIndicesChange'
    '{object}activeIndex': '_onActiveIndexChange'

  _onToDoChange: (newVal, oldVal) ->
    @$.remaining = @filterFilter(@indices, {done: false}).length

  _onActiveIndexChange: () ->
    @$.sortedActiveIndex = @sortActiveIndex()

  setActiveIndex: (index) ->
    @$.activeIndex = index
    @$.activeItem = null
    @$.sortedActiveIndex = @sortActiveIndex()

  setActiveItem: (item) ->
    @$.activeItem = _.findWhere(@$.activeIndex.items, item)

  addIndex: ->
    newIndex = @$.newIndex.trim()
    newIdxDesc = @$.newIdxDesc.trim()
    if !newIndex.length then return
    @$.indices.push
      title: newIndex
      description: newIdxDesc
      items: []

    @$.newIndex = ""
    @$.newIdxDesc = ""

  sortActiveIndex: ->
    _.groupBy(@$.activeIndex.items, (item) ->
      item.text[0]
    )

  collapseActiveIndex: ->
    $(".letter-listing").slideUp()

  expandActiveIndex: ->
    $(".letter-listing").slideDown()

  addItem: ->
    newItem = @$.newItem.trim()
    if !newItem.length then return
    @$.activeIndex.items.push
      text: newItem
      links: []
      subitems: []
    @$.newItem = ""

  addSubItem: ->
    newSubItem = @$.newSubItem.trim()
    if !newSubItem.length then return
    @$.activeItem.subitems.push(newSubItem)

    @$.newSubItem = ""

  addLink: ->
    newLink = @$.newLink.trim()
    newLinkWoProtocol = newLink.replace(/.*?:\/\//g, "") #remove http
    if !newLink.length then return

    @$http
    .get('http://textance.herokuapp.com/title/' + newLinkWoProtocol)
    .success( 
      (data) =>
        @$.activeItem.links.push
          title: data
          url: newLink
        @$.newLink = ""
    )
    .error(
      () =>
        @$.activeItem.links.push
          title: newLink
          url: newLink
        @$.newLink = ""
    )

    



