App.classy.controller

  name: 'ReadDetailCtrl'

  inject: ['$scope', '$http', '$routeParams', '$firebaseObject', '$firebaseArray', 'filterFilter']

  init: ->
    @$.activeIndex = null
    indicesRef = new Firebase('https://brilliant-inferno-1524.firebaseio.com/')
    @$.index = new @$firebaseObject(indicesRef.child(@$routeParams.indexId))
    @$.index.$loaded().then( =>
      @$.sortedItems = _.sortBy(@$.index.items, (item) -> item.text[0].toLowerCase())
      @$.groupedItemsByLetter = _.groupBy(@$.sortedItems, (item) ->
          str = item.text[0].toLowerCase()
          if not (str.length is 1 && str.match(/[a-z]/i))
            str = "*"
          str
      )
    )