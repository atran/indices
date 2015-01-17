App.classy.controller

  name: 'IndicesCtrl'

  inject: ['$scope', '$http', 'filterFilter']

  init: ->
    @$.indices = []
    @$.activeIndex = null
    @$.activeItem = null

    @index1 = 
      title: "This is an example title."
      items: [
        text: "learn angular"
        links: []
        subitems: []
      ,
        text: "build an angular app"
        links: []
        subitems: []
      ]

    @$.indices.push(@index1)

  watch: 
    '{object}indices': '_onIndicesChange'

  _onToDoChange: (newVal, oldVal) ->
    @$.remaining = @filterFilter(@indices, {done: false}).length

  setActiveIndex: (index) ->
    @$.activeIndex = index
    @$.activeItem = null

  setActiveItem: (item) ->
    @$.activeItem = item

  addIndex: ->
    newIndex = @$.newIndex.trim()
    if !newIndex.length then return
    @$.indices.push
      title: newIndex
      items: []

    @$.newIndex = ""

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

    



