class Bookmarks.Routers.BookmarksRouter extends Backbone.Router
  initialize: (options) ->
    @bookmarks = new Bookmarks.Collections.BookmarksCollection()
    @bookmarks.reset options.bookmarks

  routes:
    "new"      : "newBookmark"
    "index"    : "index"
    ":id/edit" : "edit"
    ".*"        : "index"

  newBookmark: ->
    @view = new Bookmarks.Views.Bookmarks.NewView(collection: @bookmarks)
    $("#new").html(@view.render().el)

  index: ->
    @view = new Bookmarks.Views.Bookmarks.IndexView(bookmarks: @bookmarks)
    $("#list").html(@view.render().el)

  edit: (id) ->
    bookmark = @bookmarks.get(id)

    @view = new Bookmarks.Views.Bookmarks.EditView(model: bookmark)
    $("#edit").html(@view.render().el)
