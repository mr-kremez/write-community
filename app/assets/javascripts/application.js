// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require markitup
//= require jqcloud
//= require tagcanvas.min
//= require_tree .
$(document).ready(function() {
	var oopts = {
	  	textFont: 'Impact,Arial Black,sans-serif',
	  	textColour: 'blue',
		textHeight: 20,
		maxSpeed: 0.1,
		decel: 0.9,
		depth: 0.99,
		outlineColour: 'blue',
		outlineThickness: 3,
		pulsateTo: 0.2,
		pulsateTime: 0.5,
		wheelZoom: false
	};
	if(!$('#myCanvas').tagcanvas(oopts,'tags')) {
	  // something went wrong, hide the canvas container
	  $('#myCanvasContainer').hide();
	}

});

