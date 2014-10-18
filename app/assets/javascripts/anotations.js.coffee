# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.anotations').on 'click', '.delete-anotation', (e)->
    e.stopPropagation()
    e.preventDefault()
    $.ajax
      url: $(e.target).attr('href')
      type: 'POST'
      dataType: "json",
      data: {"_method":"delete"},
      success: ()=>
        $(e.target).closest('.well').hide()
        alert("Deleted successfully");
      
