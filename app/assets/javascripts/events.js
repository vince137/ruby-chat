$(document).on('turbolinks:load', function() {
    // CHAT: ROOMS LIST
    if ($("div").attr('data-target', 'api-list').length) {
        Chat.displayRoomsList();
    }
});
