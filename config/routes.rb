Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#main'

  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'

  get '/users/login', to: 'users#login'
  post '/users/login', to: 'users#login_perform', as: 'users_login_perform'
  # resource :users
end
