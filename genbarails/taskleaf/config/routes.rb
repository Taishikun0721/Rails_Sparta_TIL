Rails.application.routes.draw do
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    patch :confirm_edit, action: :confirm_edit, on: :member
    post :import, on: :collection
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  resources :users, only: %i[edit update], module: :public


  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end