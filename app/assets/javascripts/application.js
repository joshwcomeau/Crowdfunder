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
//= require foundation
//= require cocoon
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
	$('.project_reward_tier').mouseenter(function(){
		$(this).css("background-color", "#97d596");
	});
	$('.project_reward_tier').mouseleave(function(){
		$(this).css("background-color", "#E6F0D9");
	});

  $(".project_reward_tier").click(function() {
    var tierText = $(this).children(".tier_description").html(),
        tierAmount = $(this).children(".tier_amount").html();

    $("#selected_reward").html(tierText);
    $("#pledge_amount").val(tierAmount);
    


  });

});