$(document).on('turbolinks:load', function() {
    // CHAT: ROOMS LIST
    if ($("div").attr('data-target', 'api-list').length) {
        Chat.displayRoomsList();
    }
});

$(document).ready(function(){
    // CHAT: MESSAGES SUBSCRIBE
    if ($(".chat-text").length) {
        Chat.messageSubscribe();
    }
});
