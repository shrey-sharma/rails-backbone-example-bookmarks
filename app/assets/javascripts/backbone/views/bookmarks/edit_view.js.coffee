Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.EditView extends Backbone.View
  template : JST["backbone/templates/bookmarks/edit"]

  events :
    "submit #edit-bookmark" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
