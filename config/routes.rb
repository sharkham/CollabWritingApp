Rails.application.routes.draw do
  root to: "welcome#index"
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete '/logout' => "sessions#destroy"

  resources :novels, only: [:show, :edit, :update, :destroy] do
    resources :memberships
    resources :snippets
  end
  resources :users do
    resources :novels, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
