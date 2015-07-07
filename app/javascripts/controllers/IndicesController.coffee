App.classy.controller

  name: 'IndicesCtrl'

  inject: ['$scope', '$http', '$firebaseArray', 'filterFilter']

  init: ->
    @$.indices = []
    @$.activeIndex = null
    @$.sortedActiveIndex = null
    @$.activeItem = null
    @$.sliderWidth = { width: '9001px' }

    indicesRef = new Firebase('https://brilliant-inferno-1524.firebaseio.com/')
    @$.indices = @$firebaseArray(indicesRef)

  watch:
    '{object}indices': '_onIndicesChange'
    '{object}activeIndex': '_onActiveIndexChange'

  _onToDoChange: (newVal, oldVal) ->
    @$.remaining = @filterFilter(@indices, {done: false}).length

  _onActiveIndexChange: () ->
    if @$.activeIndex?
      @$.sortedActiveIndex = @sortActiveIndex()
      numOfLetters = Object.keys(@$.sortedActiveIndex).length
      widthOfLetter = 345
      @$.sliderWidth = { width: numOfLetters * widthOfLetter + 'px'}

  setActiveIndex: (index) ->
    @$.activeIndex = index
    @$.activeItem = null
    @$.sortedActiveIndex = @sortActiveIndex()
    @$.setIndexPanelActive()
    @$.setItemPanelActive()

  setActiveItem: (item) ->
    @$.activeItem = _.findWhere(@$.activeIndex.items, item)

  addIndex: ->
    newIndex = @$.newIndex.trim()
    newIdxDesc = @$.newIdxDesc.trim()
    if !newIndex.length then return
    @$.indices.$add
      title: newIndex
      description: newIdxDesc
      items: []

    @$.newIndex = ""
    @$.newIdxDesc = ""

  sortActiveIndex: ->
    if @$.activeIndex?
      sortedItems = _.sortBy(@$.activeIndex.items, (item) -> item.text[0].toLowerCase())
      _.groupBy(sortedItems, (item) ->
        str = item.text[0].toLowerCase()
        if not (str.length is 1 && str.match(/[a-z]/i))
          str = "*"
        str
      )


  collapseActiveIndex: ->
    $(".letter-listing").slideUp()

  expandActiveIndex: ->
    $(".letter-listing").slideDown()

  addItem: ->
    newItem = @$.newItem.trim()
    if !newItem.length then return
    if not @$.activeIndex.items?
      @$.activeIndex.items = []
    @$.activeIndex.items.push
      text: newItem
      links: []
      subitems: []
    @$.indices.$save(@$.activeIndex)
    @$.newItem = ""

  addSubItem: ->
    newSubItem = @$.newSubItem.trim()
    if !newSubItem.length then return
    if not @$.activeItem.subitems?
      @$.activeItem.subitems = []
    @$.activeItem.subitems.push(newSubItem)
    @$.indices.$save(@$.activeIndex)
    @$.newSubItem = ""

  goToAlpha: (e) ->
    $("#target-" + e).velocity("scroll", container: $(".active-index"))

  addLink: ->
    newLink = @$.newLink.trim()
    newLinkWoProtocol = newLink.replace(/.*?:\/\//g, "") #remove http
    if !newLink.length then return
    if not @$.activeItem.links?
      @$.activeItem.links = []
    @$http
    .get('http://textance.herokuapp.com/title/' + newLinkWoProtocol)
    .success(
      (data) =>
        @$.activeItem.links.push
          title: data
          url: newLink
        @$.newLink = ""
        @$.indices.$save(@$.activeIndex)
    )
    .error(
      () =>
        @$.activeItem.links.push
          title: newLink
          url: newLink
        @$.newLink = ""
        @$.indices.$save(@$.activeIndex)
    )





