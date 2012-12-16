class Bookmarks.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    name: null
    address: null
    tags: null
  
class Bookmarks.Collections.BookmarksCollection extends Backbone.Collection
  model: Bookmarks.Models.Bookmark
  url: '/bookmarks'
  search : (letters)->
    return @ if letters is ""
    pattern = new RegExp(letters,"gi")
    _.filter(@.models,(model) ->
      pattern.test(model.get("tags"));)
    
  
