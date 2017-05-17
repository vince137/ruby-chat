var Chat = {

    displayRoomsList: function() {
        $.ajax({
            url: "/chat/rooms",
            success: function(result) {
                $(".chan_list").html(result);
            }
        });
    },

    messageSubscribe: function() {
        var source = new EventSource('/rt/subscribe');
        source.addEventListener('message', function(event) {
            message = JSON.parse(event.data);
            $(".chat-text").append(message.messages + " <br> ");
        });
    },

    removeMessageValue: function () {
        $("input[name='message']").val("");
    }
}
