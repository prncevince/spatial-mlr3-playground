window.addEventListener("DOMContentLoaded", function(){
  $(document).ready(function () {
    $('.chunk').each(function(i,el) {
      col = $(el).find('.row > .col-md-12 > .code-folding-btn').parent()
      $(el).children().filter(':header').first().attr('class', 'hasAnchor pull-left float-left').prependTo(col)
    })
  })
})