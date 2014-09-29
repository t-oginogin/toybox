# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # if ($(window).height() + 100) < $(document).height()
  $('#top-link-block').removeClass('hidden').affix(offset: {top:100})
