$(document).ready(function(){

    // CHAT: ROOMS LIST
    if ($("div").attr('data-target', 'api-list').length) {
        Chat.displayRoomsList();        
    }

});
