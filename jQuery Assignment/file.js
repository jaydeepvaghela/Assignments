radioHandler = (e) => {
    if ($(e).prop("checked")) {
        $("#next").removeAttr('disabled')
    }
}
$(document).ready(function () {
    $('#next').hide();
});

$('#btn1').click(function () {
    $('h1').hide();
    $('#btn1').hide();

    $('#1').addClass('active');
    $('#next').show();

});

$('#next').click(function () {
    var $current = $('.ques.active');
    $('.ques').removeClass('active');
    $current.next('div').addClass('active');
});

var answers = { radio1: "HyperText Markup Language", radio2: "Width and Height", radio3: "All of the above", radio4: "Inline CSS", radio5: "HTML, CSS, JavaScript" };

$('#result').click(function () {
    var score = 0;
    $('#result').hide();
    $('#next').hide();
    $.each(answers, function (ques, answer) {
        if($('input:radio[name="' + ques + '"]:checked').val() == answer)
            score += 1;
    });
    $('#questions').append("<center><h1 style='color:#FFFFFF'> You obtained: " + score + "/5 </h1><center>");
});
