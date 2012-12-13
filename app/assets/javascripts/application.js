// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function set_navbar(active) {
	$("#" + active).addClass("active");
}

function set_inner_nav(active) {
	$("#teams-list").find("#" + active).addClass("active");
}

function set_private_nav(active) {
	$("#private-nav").find("#" + active).addClass("active");
}

function show_feedback (msg, type, after, element) {
	var fb_element = "<div id='feedback' class='hidden alert'></div>";
	if (after) {
		$("#"+element).after(fb_element);
	} else {
		$("#"+element).before(fb_element);
	}
	
	
	$("#feedback").html(msg);
	$("#feedback").addClass("alert-" + type);
	$("#feedback").removeClass("hidden");
	
	setTimeout(function () {
		$("#feedback").remove();
	}, 3000)
}