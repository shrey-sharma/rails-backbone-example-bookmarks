Bookmarks.Views.Bookmarks ||= {}

class Bookmarks.Views.Bookmarks.EditView extends Backbone.View
  template : JST["backbone/templates/bookmarks/edit"]

  events :
    "submit #edit-bookmark" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset("created_at")
    @model.unset("updated_at")
    @model.unset("errors")
    @model.save(null,
      success : (bookmark) =>
        @model = bookmark
        window.location.hash = "index"
     
      error: (bookmark, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
        error=@model.get("errors")
        name_msg= if(error.name)then "Error: Name "+ error.name else ""
        add_msg= if(error.address)then "Error: " + error.address else ""
        err = if(name_msg != "")then name_msg + "\n" + add_msg else add_msg 
        alert err
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    @
