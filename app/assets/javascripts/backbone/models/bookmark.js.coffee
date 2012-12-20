class Bookmarks.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    name: null
    address: null
    tags: null
  
class Bookmarks.Collections.BookmarksCollection extends Backbone.Collection
  model: Bookmarks.Models.Bookmark
  url: '/bookmarks'
  search : (key) ->
    return @ if key is ""
    pattern = new RegExp(key,"gi")
    _.filter(@.models,(model) ->
      pattern.test(model.get("tags"));)
    
  
