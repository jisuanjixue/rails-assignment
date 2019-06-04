Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get '/home',    to: 'static_pages#home'
  get "current/courses" => "courses#current"
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users 
  resources :courses do
    member do
      post :upvote
      post :downvote
    end
  end

  resources :categories

  resources :locations
 
end
