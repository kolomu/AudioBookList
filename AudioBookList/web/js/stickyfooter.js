$(window).bind("load", function () {
    var magicNumber = 80;
    var footer = $("footer");
    var pos = footer.position();
    var height = $(window).height();
    height = height - pos.top;
    height = height - footer.height();
    height = height - magicNumber;
    if (height > 0) {
        footer.css({
            'margin-top': height + 'px'
        });
    }
});

