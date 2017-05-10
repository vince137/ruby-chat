$(document).ready(function() {
    $("[name='js-api']").submit(function(e) {
        e.preventDefault();
        let form = $(this);
        $.ajax({
            url: form.attr('action'),
            type: form.attr('method'),
            data: form.serialize(),
            success: function(response) {
                console.log(response);
            },
            error: function (xhr, status, error) {
                console.log(status + " : " + error);
            }
        });
    });
});
