Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]

  get '/users/:id/promote', to: 'users#promote'
  get '/activate', to: 'users#activate'

  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy, :index] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:index, :create, :edit, :show, :update, :destroy] do
    resources :notes, only: [:create, :destroy]
  end

  resources :notes, only: [:index]

  root 'sessions#new'
end
