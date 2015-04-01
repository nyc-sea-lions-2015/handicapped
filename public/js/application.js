$(document).ready(function() {

  $('.score_form').on('submit', function(event){
    event.preventDefault();
    console.log("boom");
    $target = $(event.target);

    $.ajax({  url: $target.attr('action'),
              method: $target.attr('method'),
              data: $target.serialize(),
              }).done(function(box){
                console.log("here?");
                $('.all_scores').append(box);
              });
  });

  $('.score_delete').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target);

    $.ajax({  url: $target.attr('action'),
              method: $target.attr('method'),
              data: $target.serialize(),
              }).done(function(response){
                $target.closest('.score').remove();
              });
  });

});
