Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users, only: [:index, :show] do
    resources :groups, only: [:index, :show, :new, :create]
    resources :entities, only: [:index, :show, :new, :create]
  end

  root "users#index"
end
