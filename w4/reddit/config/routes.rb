Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resources :posts, only: [:new, :create]
  end

  resources :posts, except: [:new, :index, :create] do
    resources :comments, only: [:new, :create]
  end
  resources :comments, except: [:new, :index, :create]

  root to: "sessions#new"
end
