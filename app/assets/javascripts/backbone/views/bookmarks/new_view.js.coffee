Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.NewView extends Backbone.View
  template: JST["backbone/templates/bookmarks/new"]

  events:
    "submit #new-bookmark": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      @render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (bookmark) =>
        @model = bookmark
        window.location.hash = "index"

      error: (bookmark, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
        error=@model.get("errors")
        name_msg= if(error.name)then "Error: Name "+ error.name else ""
        add_msg= if(error.address)then "Error: " + error.address else ""
        err = if(name_msg != "")then name_msg + "\n" + add_msg else add_msg 
        @collection.pop()
        alert err
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @.$("form").backboneLink(@model)
    @
