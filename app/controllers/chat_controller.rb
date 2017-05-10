class ChatController < ApplicationController
    def rooms
        @rooms = Room.all.order(created_at: :desc)
        
        render file: "chat/_rooms", layout: false
    end
end
