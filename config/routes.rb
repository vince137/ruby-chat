Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root 'pages#home'

  mount ChatBack::Rooms => '/'
  mount ChatBack::ChatMessages => '/'


scope "/rt", controller: :rt do
    get :subscribe
end


  scope "/chat", controller: :chat do
      get :rooms
      get :subscribe
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
