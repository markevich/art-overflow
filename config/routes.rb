require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  resources :search, only: :index
  resources :users, except: [:show, :destroy] do
    member do
      post :follow
      post :stop_following
    end

    resources :pictures
    resources :albums
    resources :likes
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
    member do
      post :like
      post :unlike
    end
  end
  resources :pictures do
    member do
      post :like
      post :unlike
    end
  end
  resources :comments, only: [:destroy, :create]

  resources :ping, only: :index

  root to: 'pictures#index'
end
