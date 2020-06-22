Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show]

  root 'posts#index'
end