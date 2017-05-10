var Chat = {
    displayRoomsList: function() {
        $.ajax({
            url: "/chat/rooms"
        });
    }
}
