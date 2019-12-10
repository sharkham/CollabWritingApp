Rails.application.routes.draw do
  root to: "welcome#index"
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete '/logout' => "sessions#destroy"

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users do
    resources :novels, only: [:index]
  end

  resources :novels, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :snippets
    resources :memberships
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
