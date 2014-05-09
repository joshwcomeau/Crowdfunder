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

  // Decoration for project tier mouseover
	$('.project_reward_tier').mouseenter(function(){
		$(this).css("background-color", "#97d596");
	});
	$('.project_reward_tier').mouseleave(function(){
		$(this).css("background-color", "#E6F0D9");
	});


  // Show form for pledging
  $(".project_reward_tier").click(function() {

    var tierText = $(this).children(".tier_description").html(),
    tierAmount = $(this).children(".tier_amount").html(),
    tierID = $(this).attr("id").split("_")[1];


    $("#selected_reward").html(tierText);
    $("#pledge_tier_id").val(tierID);
    $("#pledge_amount").val(tierAmount);      
    $(".pledge_form").show(500);
  });


  // AJAX submit pledge
  $("#new_pledge").submit(function(event) {
    var pledgeAmount = $("#pledge_amount"),
        tierID = $("#pledge_tier_id");

    event.preventDefault();
    $.ajax({
      url: $(this).attr("action"),
      type: "POST",
      dataType: 'json',
      data: $( this ).serialize(),
      error: function (jqXHR, textStatus, errorThrown) {
        alert("jqXHR: " + jqXHR.status + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown);
      }

    }).done(function(data) {

      $(".pledge_form").hide();

      var tierDiv = $("#tier_"+data.tierID);


      tierDiv.children(".tier_backers").html(data.backers);
      tierDiv.children(".tier_sum").html(data.tierSum);
      $("#project_funded_amount").html(data.funded)

      $("#pledge_confirmation").children("h2").html(data.msgHeader);
      $("#pledge_confirmation").children("p").html(data.msg);

      $("#pledge_confirmation").fadeIn(250).delay(2000).slideUp(1000);
    });
  });
 
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').html("Fetching more products...");
        console.log(url);
        return $.getScript(url);
      }
    });





});

















