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
//= require jquery3
//= require jquery
//= require select2
//= require select2_locale_ja 

//= require popper
//= require bootstrap-sprockets
//= require jquery.raty.js
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//モーダルの設定
$(function () {
  $('#openModal').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});

//sidebarの設定。toggleClassで制御
$(document).on('turbolinks:load',function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('close');
        $('.sidebar-icon').toggleClass('open');
    });
});

$(document).on('turbolinks:load',function () {
  $('.tab').click(function(){
    $('.tab-active').removeClass('tab-active');
    $(this).addClass('tab-active');
    $('.box-show').removeClass('box-show');
    const index=$(this).index();
    $('.tab-box').eq(index).addClass('box-show');
  });
});