module ChatBack
    class ChatMessages < Grape::API
        version 'v1', using: :header, vendor: "chat"
        format :json
        prefix :api

        helpers do
            def authenticate!
              error!('Unauthorized. Invalid or expired token.', 401) unless current_user
            end

            def current_user
              user = User.where(api_token: params[:token]).first
              if user
                @current_user = user
              else
                false
              end
            end
        end

        desc "Create a message"
        params do
            requires :message, type: String, allow_blank: false
        end

        resource :messages do
            post do
                params['id_user'] = current_user.id

                params['token'].delete
                
                safe_params = ActionController::Parameters.new(params).permit(:message, :id_user)
                Message.create(safe_params);
            end
        end
    end
end
