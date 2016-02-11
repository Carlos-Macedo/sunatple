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
//= require foundation
//= require turbolinks
//= require_tree .
$(function () {
    $('#current_ruc').on('change', function () {
        var current_ruc = "?current_ruc=" + $(this).val();
        if (current_ruc) {
            window.location = current_ruc;
        }
        return false;
    });
    $('#current_year').on('change', function () {
        var current_year = "?current_year=" + $(this).val();
        if (current_year) {
            window.location = current_year;
        }
        return false;
    });
    $('#current_month').on('change', function () {
        var current_month = "?current_month=" + $(this).val();
        if (current_month) {
            window.location = current_month;
        }
        return false;
    });
});
$(function(){ $(document).foundation(); });
