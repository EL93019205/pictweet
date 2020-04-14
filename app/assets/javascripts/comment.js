$(function(){
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
  })
})
