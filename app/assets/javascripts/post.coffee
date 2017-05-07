# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

this.lat_long = [0, 0]

@loadGeoLocation = () -> navigator.geolocation.getCurrentPosition(getGeoLocation)

@getGeoLocation = (position) -> 
	read_lat = position.coords.latitude
	read_long = position.coords.longitude
	document.getElementsByTagName('form')[0].stash_element_text_content.value = "#{read_lat},#{read_long}"
	