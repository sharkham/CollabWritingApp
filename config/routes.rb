Rails.application.routes.draw do
  root to: "welcome#index"
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete '/logout' => "sessions#destroy"

  resources :snippets
  resources :novels
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
