Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'wise_apps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/wise_apps', to: 'wise_apps#index'
  # resources :wise_apps
  
  post '/chat', to: 'chat#interact'
  resources :accounts
  post '/login', to: 'accounts#login'
  post '/login/verify_otp', to: 'accounts#verify_otp'
end
