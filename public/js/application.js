$(document).ready(function() {
  $('div').on("click", ".upvote-button", function(event) {
  event.preventDefault();
   $this = $(this)
   url = $(this).parent().attr('action')
   console.log(url)

   $.ajax({
     url: url,
     type: 'POST',
     data: { value: 1}
   })
   .done(function(response) {
      $this.parent().parent().find('.vote').text(response)
      console.log($this.parent().next().find('input'))
      $this.parent().next().find('input').removeClass('red')
      $this.addClass('green')
   })
   .fail(function() {
     alert("error");
   })


  })

  $('div').on("click", '.downvote-button', function(event) {
  event.preventDefault();
    $this = $(this)
    url = $this.parent().attr('action')
    console.log(url)

    $.ajax({
      url: url,
      type: 'POST',
      data: { value: -1}
    })

   .done(function(response) {
      console.log($this.parent().prev().find('input').first())
      $this.parent().prev().find('input').first().removeClass('green')
      $this.parent().parent().find('.vote').text(response)
      $this.addClass('red')
   })
   .fail(function() {
     alert("error");
   })
  })
});
