Rails.application.routes.draw do
  root to: "welcome#index"
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete '/logout' => "sessions#destroy"

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :users do
    resources :novels, only: [:index, :create]
  end

  resources :novels, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :snippets
    resources :memberships, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
