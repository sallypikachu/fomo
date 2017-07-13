Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'hello_world', to: 'hello_world#index'
end
