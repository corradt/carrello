// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
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
//= require best_in_place
//= require_tree .


  // now here will override the behaviour of bind, pratically when we get an response of success by ajax, //this response will be generate when after clicking on the quantity field by best_in_place everything //is successfull than we want to pass the total variable created in update located in the controller //ordered_products_controller

$('.best_in_place').bind("ajax:success", function (event, data) { 
   // data parameter contains the values passed to update.json.jbuilder through the update function //located in the controller ordered_products_controller
   var returned_data = JSON.parse(data); // of course before we need to parse the data
    $('.total').html(returned_data.total); //#total is the id of the div where we want to display our variable got	

});
