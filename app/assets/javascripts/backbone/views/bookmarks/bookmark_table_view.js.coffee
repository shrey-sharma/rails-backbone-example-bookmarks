Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.BookmarkTableView extends Backbone.View
  template: JST["backbone/templates/bookmarks/bookmark-table"]

  el: "bookmarks-table"

  @addAll: ->
    alert "Here"
    @model.each(@addOne)

  @addOne: (bookmark) ->
    view = new Bookmarks.Views.Bookmarks.BookmarkView({model : bookmark})
    @$("tbody").append(view.render().el) 

  render: ->
    $(@el).html(@template(bookmark: @model.toJSON() ))
    alert "YES"
    @addAll
    return this
