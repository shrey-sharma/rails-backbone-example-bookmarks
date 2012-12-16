Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.IndexView extends Backbone.View
  template: JST["backbone/templates/bookmarks/index"]
  
  events:
    "submit #filter" : "filter"

  initialize: () ->
    @options.bookmarks.bind('reset', @render)
    @options.bookmarks.bind('sync',@render)
  
  filter: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @fil = $("#key").val()
    @list=@options.bookmarks.search(@fil)
    alert JSON.stringify(@list)
    @render() if @fil is "" else @renderlist()
    return

  renderlist: ->
    alert "here"
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    @addOne model for model in @list
    alert "done"
  
  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Bookmarks.Views.Bookmarks.BookmarkView({model : bookmark})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    @addAll()
    @
