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
        var source = new EventSource('/chat/subscribe');
        source.addEventListener('message', function(event) {
            message = JSON.parse(event.data);
        });
    }
}
