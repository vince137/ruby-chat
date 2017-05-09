class PagesController < ApplicationController
    def home

        if user_signed_in?
            @chat = Chat.new
            @chat.load
        else
            redirect_to new_user_session_path
        end
    end
end
