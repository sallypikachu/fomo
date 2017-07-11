Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  devise_for :users
  get 'hello_world', to: 'hello_world#index'
end
