Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:index, :show]

  root 'posts#index'
end