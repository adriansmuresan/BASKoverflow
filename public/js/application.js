$(document).ready(function() {
  $('.upvote-button').on("click", function(event) {
  event.preventDefault();
   $this = $(this)
   url = $(this).parent().attr('action')

   $.ajax({
     url: url,
     type: 'POST',
     data: { value: 1}
   })
   .done(function(response) {
      $this.parent().parent().find('.vote').text(response)
      $('.downvote-button').removeClass('red')
      $this.addClass('green')
   })
   .fail(function() {
     alert("error");
   })


  })

  $('.downvote-button').on("click", function(event) {
  event.preventDefault();
    $this = $(this)
    url = $this.parent().attr('action')

    $.ajax({
      url: url,
      type: 'POST',
      data: { value: -1}
    })

   .done(function(response) {
      $this.parent().parent().find('.vote').text(response)
      $('.upvote-button').removeClass('green')
      $this.addClass('red')
   })
   .fail(function() {
     alert("error");
   })
  })
});
