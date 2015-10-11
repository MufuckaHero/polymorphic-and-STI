# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#posts').imagesLoaded ->
    $('#posts').masonry
      itemSelector: '.box'
      isFitWidth: true
$ ->
  $("#tag_ids").select2({ tags: true, theme: "bootstrap" }); 