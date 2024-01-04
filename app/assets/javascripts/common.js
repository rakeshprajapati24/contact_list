
var alpha = '';

function updateSearch(value) {
  const searchInput = document.getElementById('search');

  var number = value.replace(/\D/g, '');

  var alphabet = value.replace(/[^A-Za-z]/g, '');

  searchInput.value += number;

  alpha += alphabet;

  searchContacts(alpha + searchInput.value);
}

function searchContacts(query) {
  $.getScript('/search?query=' + query);
  console.log(query);
}





$(document).ready(function() {
  $(".add-record").click(function() {
    $("#popup1, #overlay1").fadeIn();
    $.getScript('/contacts/new')
  });

  $("#close-btn1, #overlay1").click(function() {
    $("#popup1, #overlay1").fadeOut();
  });
});