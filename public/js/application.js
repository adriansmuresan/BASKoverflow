$(document).ready(function() {
  $('.upvote-button').on("click", function(event) {
    event.preventDefault
   $this = $(this)
   url = $(this).parent().attr('action')

   $.ajax({
     url: url,
     type: 'POST',
     data: { value: 1}
   })
   .done(function(response) {
      $this.parent().parent().find('span').text(response)
      $this.addClass('green')
   })
   .fail(function() {
     alert("error");
   })


  })

  $('.downvote-button').on("click", function() {
    $(this).addClass('red');
  })
});
