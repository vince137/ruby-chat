class ChatController < ApplicationController
    include ActionController::Live

    def rooms
        @rooms = Room.all.order(created_at: :desc)
        render file: "chat/_rooms", layout: false
    end

    def subscribe
        response.headers['Content-Type'] = 'text/event-stream'
        sse = SSE.new(response.stream)
        begin
            Message.on_change do |messages|
                sse.write({messages: messages}, event: "message")
            end
        rescue IOError
        ensure
            sse.close
        end
    end
end
