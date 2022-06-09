Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get 'profile', to: 'pages#profile'
  get 'inbox', to: 'chatrooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :destroy, :create, :show]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  put '/post/:id/like', to: 'posts#like', as: 'like'

  # match :like, to: 'likes#create', as: :like, via: :post
  # match :unlike, to: 'likes#destroy', as: :unlike, via: :post
end
