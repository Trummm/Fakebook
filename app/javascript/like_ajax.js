$(function(){
  $(".post-like").on("click", function(){
    var post_id = $(this).data("id")
    var data = $.extend(data, {authenticity_token: $('meta[name="csrf-token"]').attr('content')});
    $.ajax({
      url: "/posts/"+ post_id +"/likes",
      data: data,
      method: "POST"
    }).done(function(res){
        console.log(res)
      })
  })
})
