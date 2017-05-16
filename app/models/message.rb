class Message < ApplicationRecord
    after_save :notify_message_added

    def self.on_change
        ActiveRecord::Base.connection.execute "LISTEN messages"
        loop do
            ActiveRecord::Base.connection.raw_connection.wait_for_notify do |event, pid, message|
                yield message
            end
        end
    ensure
        ActiveRecord::Base.connection.execute "UNLISTEN messages"
    end

    def notify_message_added
        if (message_changed?)
            Message.connection.execute "NOTIFY messages, '#{message}'"
        end
    end
end
