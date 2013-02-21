# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


Main = exports ? this

Main.do_settle = () -> navigator.geolocation.getCurrentPosition(location_callback)

Main.location_callback = (position) ->
  coords = position.coords
  ll = coords.latitude + "," + coords.longitude
  window.location = "/settle?ll=" + ll