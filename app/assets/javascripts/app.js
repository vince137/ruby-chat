$(document).ready(function() {
    $("[name='js-api']").submit(function(e) {
        e.preventDefault();
        let form = $(this);
        var callback_success = form.attr('data-success-callback');

        $.ajax({
            url: form.attr('action'),
            type: form.attr('method'),
            data: form.serialize(),
            success: function(response) {
                console.log(response);
                if (callback_success === "chat_displayRoomsList") {
                    Chat.displayRoomsList();
                }
            },
            error: function (xhr, status, error) {
                console.log(status + " : " + error);
                console.log(xhr);
            }
        });
    });
});
