require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  resources :search, only: :index
  resources :users, except: [:show, :destroy] do
    resource :follow, only: [:create, :destroy]
    resources :follows, only: [:index]
    resources :followers, only: [:index], controller: 'user_followers'
    resources :pictures
    resources :albums
    resources :likes, only: :index, controller: 'user_likes'
    resource :notification_settings, only: [:show, :update]
  end

  resource :user_passwords, only: [:edit, :update]

  resources :user_avatars, only: [:edit, :update]
  resources :album_avatars, only: [:edit, :update]

  resources :albums, except: :show do
    resources :pictures
  end

  resources :activities, only: [:index]

  resources :comments do
    resource :like, only: [:create, :destroy]
  end

  resources :pictures do
    resource :like, only: [:create, :destroy]
    resources :likes, only: :index, controller: 'picture_likes'
  end

  resources :comments, only: [:destroy, :create]

  resources :ping, only: :index

  root to: 'pictures#index'
end
