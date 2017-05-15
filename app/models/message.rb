class Message < ApplicationRecord
    after_create :notify_message_added

    def self.on_change
        Message.connection.execute "LISTEN messages"
        loop do
            Message.connection.raw_connection.wait_for_notify do |event, pid, message|
                yield message
            end
        end
    ensure
      Message.connection.execute "UNLISTEN messages"
    end

    def notify_message_added
        Message.connection.execute "NOTIFY messages, 'data'"
    end


end
