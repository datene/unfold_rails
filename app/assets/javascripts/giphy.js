$(function(){  

 $("#giphy-submit-button").on("click", function(e){
  e.preventDefault();
  var url = $('#giphy-url-placeholder').text();
  if (url == "" && !$('.warning-message').length) {
    $(".giphy-form-container").append('<div class="warning-message">Please select a cool giphy</div>');
  }
  else {
    $('#giphy_url').val(url);
    $('#new_giphy').submit();
  }
});

 $("#giphy-select-form").on("submit", function(e){
  e.preventDefault();
  var keyword = $("#keyword").val();
  changePicture(keyword);
});

 function changePicture(keyword) {
  var url = "http://api.giphy.com/v1/gifs/random?tag=" + keyword + "&api_key=dc6zaTOxFJmzC";
  $.ajax({
    type: "GET",
    url: url,
    success: function(data){
      changeBackground(data.data.image_url);
    },
    error: function(data){
      console.log('error')
    }
  });
}

function changeBackground(imageUrl){
  $(".giphy-image-container").css("background-image", "url(" + imageUrl + ")");
  $('#giphy-url-placeholder').text(imageUrl);
}

});
