$(document).ready(function() {
  var title = $('.article-title');
  title.text(function(index, currentText) {
    return currentText.substr(0, 50) + '..';
  });

  var summary = $('.summary');
  summary.text(function(index, currentText) {
    return currentText.substr(0, 150) + '...';
  });


  $(document).on('click', '.read-link', function() {
  var article = $('div.article-bloc')
    if ($(this).hasClass('is-true')) {
      $(this).closest(article).removeClass('true').addClass('false');
    } else {
      $(this).closest(article).removeClass('false').addClass('true');
    }

  });

});
