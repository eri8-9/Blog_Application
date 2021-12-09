Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
