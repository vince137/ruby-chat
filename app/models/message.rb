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
            user_infos = User.find(id_user)
            if user_infos
                Message.connection.execute "NOTIFY messages, '#{user_infos.username} - #{message}'"
            end
        end
    end
end
