module ChatBack
    class Rooms < Grape::API
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

        desc "Create a room"
        params do
            requires :title, type: String
        end
        resource :rooms do
            post do
                params['proprietary_id'] = current_user.id
                safe_params = ActionController::Parameters.new(params).permit(:title, :proprietary_id)
                Room.create(safe_params);
            end
        end
    end
end
