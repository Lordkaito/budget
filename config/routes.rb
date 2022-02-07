Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users, only: [:index, :show] do
    resources :groups
    resources :entities
  end

  root "home#index"
end
