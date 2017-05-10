var Chat = {
    displayRoomsList: function() {
        $.ajax({
            url: "/chat/rooms",
            success: function(result) {
                $(".chan_list").html(result);
            }
        });
    }
}
