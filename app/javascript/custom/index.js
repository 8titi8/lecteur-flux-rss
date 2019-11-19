$(document).ready(function() {
  var summary = $('.summary');
  summary.text(function(index, currentText) {
    return currentText.substr(0, 150) + '...';
  });
});
