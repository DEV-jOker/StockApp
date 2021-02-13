// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load",function(){
  $(".remove-stock").click(function(e){
    alert("test");
    var ele = $(this);
    var symbol = Number($(this).attr("stock-id"));
    $.ajax({
      type: "delete",
      url: '/userstocks/'+symbol,
      data: {},
      success: function(res){
        //ele.hide();
        ele.closest('tr').remove();
      },
      error: function(err){
    
      }
    });
  });
  $(".remove-user").click(function(e){
    alert("test");
    var ele = $(this);
    var id = Number($(this).attr("user-id"));
    $.ajax({
      type: "delete",
      url: '/friendships/'+id,
      data: {},
      success: function(res){
        //ele.hide();
        alert("removed")
      },
      error: function(err){
    
      }
    });
  });
})


