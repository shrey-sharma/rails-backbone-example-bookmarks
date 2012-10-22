Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.ShowView extends Backbone.View
  template: JST["backbone/templates/bookmarks/show"]
  el = "#bookmark"
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
