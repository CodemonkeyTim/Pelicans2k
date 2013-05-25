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
//= require jquery_ujs
//= require_tree .
//= require twitter/bootstrap

// require jquery.ui.all

function set_navbar(active) {
	$("#" + active).addClass("active");
}

function set_inner_nav(active) {
	$("#teams-list").find("#" + active).addClass("active");
}

function set_private_nav(active) {
	$("#private-nav").find("#" + active).addClass("active");
}

var fb_id = 0;

function show_feedback (msg, type, after, element) {
	var el_id = "#feedback_" + fb_id;
	var fb_element = "<div id='feedback_" + fb_id  + "' class='alert fb'></div>";
	
	var msg_exists = false;
	
	$(".fb").each(function () {
		if ($(this).html() == msg) {
			msg_exists = true;
			return true;
		}
	});
	
	if (msg_exists) {
		return;
	}
	
	if (after) {
		$("#"+element).after(fb_element);
	} else {
		$("#"+element).before(fb_element);
	}
	
	$(el_id).html(msg);
	$(el_id).addClass("alert-" + type);
	$(el_id).hide();
	
	$(el_id).slideToggle();
	
	setTimeout(function () {
		$(el_id).slideToggle();
		setTimeout(function () {
			$(el_id).remove();
		}, 600)
	}, 3800)
	
	fb_id += 1;
}