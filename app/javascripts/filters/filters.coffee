'use strict'

### Filters ###

angular.module('app.filters')

.filter 'toArray', ->
  (obj) ->
    if !(obj instanceof Object)
      return obj
    _.map obj, (val, key) ->
      Object.defineProperty val, '$key',
        __proto__: null
        value: key