$(document).ready(function() {
  // Truncate the title if too long
  var title = $('.article-title');
  title.text(function(index, currentText) {
    return currentText.substr(0, 50) + '..';
  });

  // Limit the summary to 150 chars
  var summary = $('.summary');
  summary.text(function(index, currentText) {
    return currentText.substr(0, 150) + '...';
  });

  // Make the read/unread button change the background color of the article block
  $(document).on('click', '.read-link', function() {
  var article = $('div.article-bloc')
    if ($(this).hasClass('is-true')) {
      $(this).closest(article).removeClass('true').addClass('false');
    } else {
      $(this).closest(article).removeClass('false').addClass('true');
    }

  });

});
