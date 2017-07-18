Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do 
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :events, only: :index
  get 'hello_world', to: 'hello_world#index'
end
