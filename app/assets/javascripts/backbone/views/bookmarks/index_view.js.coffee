Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.IndexView extends Backbone.View
  template: JST["backbone/templates/bookmarks/index"]  
  el = "#bookmark"
  #events:
  #  "submit #filter": "filtertags"

  initialize: () ->
    @options.bookmarks.bind('reset', "@addAll")
    #@fil=$("#tag").val()
 
  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Bookmarks.Views.Bookmarks.BookmarkView({model : bookmark})
    #stags = bookmark.get("tags")
    #tags = stags.split(", ")
    #alert @fil
    #if @fil? and _.contains(tags,@fil)
     # @$("tbody").append(view.render().el)
    #else if not @fil?
    @$("tbody").append(view.render().el) 

  render: =>
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    @addAll()
    return this

  #filtertags: ->
   # @fil=$("#tag").val()
   # @addAll()

