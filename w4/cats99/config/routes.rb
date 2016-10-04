Rails.application.routes.draw do
  resources :cats, only: [:index, :create, :update, :destroy, :show, :new, :edit]
  resources :cat_rental_requests, only: [:new, :create]

  resources :cat_rental_requests do
    get "approve"
    get "deny"
  end
end
