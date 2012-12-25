Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.IndexView extends Backbone.View
  template: JST["backbone/templates/bookmarks/index"]
  
  events:
    "submit #filter" : "filter"

  initialize: () ->
    @options.bookmarks.bind('reset', @render)
    @options.bookmarks.bind('sync',@render)
    $("#new").fadeTo("slow",0.33)
    $("#edit").fadeTo("slow",0.33)
    $("#list").fadeTo("slow",1)
  
  filter: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @fil = $("#key").val()
    @list=@options.bookmarks.search(@fil)
    if @fil is "" then @render() else @renderlist()
    return

  renderlist: ->
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    $("#key").val(@fil)
    @addOne model for model in @list
    @
  
  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Bookmarks.Views.Bookmarks.BookmarkView({model : bookmark})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON()))
    @addAll()
    @
