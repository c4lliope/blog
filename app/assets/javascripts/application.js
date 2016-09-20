// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs

//= require bowser

//= require_tree .

function getTimeRemaining(endtime){
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  var days = Math.floor( t/(1000*60*60*24) );

  return {
    'total': t,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function startTimer(expiration, display) {
  function timer() {
    var remaining = getTimeRemaining(expiration);

    document.querySelector(".timer-count-days").textContent = remaining.days;
    document.querySelector(".timer-count-hours").textContent = remaining.hours;
    document.querySelector(".timer-count-minutes").textContent = remaining.minutes;
    document.querySelector(".timer-count-seconds").textContent = remaining.seconds;
  };

  // we don't want to wait a full second before the timer starts
  timer();
  setInterval(timer, 1000);
}

window.onload = function () {
  var expiration = new Date($(".timer").data("expiration"));
  var display = document.querySelector('.timer');
  startTimer(expiration, display);
};
