$(document).ready(function(){
    $('.box').click(function(){
        $(this).fadeTo(1000, 0, null, function(){
            setTimeout(() => {
                $('.info').hide();
            }, 100);
            $('body').append('<div class="info"><p>The animation has finished</p></div>');
        });
    });
});