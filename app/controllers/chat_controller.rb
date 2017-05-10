class ChatController < ApplicationController
    def rooms
        @rooms = Room.all
        render file: "chat/_rooms", layout: false
    end
end
