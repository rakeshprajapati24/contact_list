
function updateSearch(value) {
  const searchInput = document.getElementById('search');
  
  if (value.length === 1 && /[A-Z]/.test(value)) {
    searchInput.value += value;
  } else {
    searchInput.value += value;
  }

  searchContacts(searchInput.value);
}


function searchContacts(query) {
  $.getScript('/search?query='+query)
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