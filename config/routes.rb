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

  resources :users do
    resources :follows, only: [:create]
  end

  resources :follows, only: [:destroy]
end
