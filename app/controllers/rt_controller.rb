require 'reloader/sse'

class RtController < ApplicationController
    include ActionController::Live

    def subscribe
        response.headers['Content-Type'] = 'text/event-stream'
        sse = Reloader::SSE.new(response.stream)
        begin
            puts "send CALL"
            Message.on_change do |messages|
                puts "#{messages}"
                sse.write({messages: messages}, event: "message")
            end
        rescue IOError
            puts "Connection ended"
        ensure
            puts "Close stream"
            sse.close
        end
    end
end
