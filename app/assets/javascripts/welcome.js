var ready;
ready = function() {
  $(".company_row, .job_row").click(function() {
        window.document.location = $(this).attr("href");
  });
  $('.checkbox_filter').click(function() {
      $('#filter_form').submit();
  });
  var converter = Markdown.getSanitizingConverter();
  var editor = new Markdown.Editor(converter);
  editor.run();
};

$(document).ready(ready);
$(document).on('page:load', ready);
