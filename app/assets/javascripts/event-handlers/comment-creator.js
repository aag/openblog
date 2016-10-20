$('.js-show-comment-form').on('click', function(e) {
    e.preventDefault();
    var $clickedElem = $(e.target);

    $clickedElem.parents('.js-comment-creator')
        .find('.js-form-wrapper')
        .show();
});
