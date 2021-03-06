// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  $('#add_comm').click(function(event){
    event.preventDefault();

    $(this).hide();
    console.log(this)
    var url = $(this).attr('href');

    $.get(url, function(serverResponse, status, request){
      console.log(serverResponse)
      $('#comments').append(serverResponse);
    });
  });

  $('#comments').on('submit', '#new_comment', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(serverResponse, status, request){
      $('#comments').append(serverResponse);
    });

    $(this).parent('div').remove();

    $('#add_com').show();
  });

});