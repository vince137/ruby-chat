require 'reloader/sse'

class ChatController < ApplicationController
    include ActionController::Live

    def rooms
        @rooms = Room.all.order(created_at: :desc)
        render file: "chat/_rooms", layout: false
    end
end
