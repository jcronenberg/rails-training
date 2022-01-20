Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#main'

  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'

  get '/users/login', to: 'users#login'
  post '/users/login', to: 'users#login_perform', as: 'users_login_perform'

  post '/users/logout', to: 'users#logout'
  # resource :users

  get '/boards/:id', to: 'boards#show', as: 'boards_show'
  get '/board_threads/new', to: 'board_threads#new'
  post 'board_threads/new', to: 'board_threads#create_new'
  get '/board_threads/:id', to: 'board_threads#show', as: 'board_thread_show'
end
