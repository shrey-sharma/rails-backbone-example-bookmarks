class Bookmarks.Models.Bookmark extends Backbone.Model
  urlroot: '/bookmarks'
  paramRoot: 'bookmark'

  defaults:
    name: null
    address: null
    tags: null

class Bookmarks.Collections.BookmarksCollection extends Backbone.Collection
  model: Bookmarks.Models.Bookmark
  url: '/bookmarks'
