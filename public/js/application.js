$(document).ready(function() {

  $('.score_form').on('submit', function(event){
    event.preventDefault();
    console.log("boom");
    $target = $(event.target);

    $.ajax({  url: $target.attr('action'),
              method: $target.attr('method'),
              data: $target.serialize(),
              }).done(function(box){
                $('.score_form').trigger('reset');
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

    $('#choice').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    console.log($target.attr('href'));
    $.ajax({  url: $target.attr('href'),
              method: 'GET',
              dataType: 'HTML'
    }).done(function(data){
      $('#choice').replaceWith(data);

    });
  });

});
