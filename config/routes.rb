Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#main'

  # get '/users/new', to: 'users#new'
  resource :users
end
