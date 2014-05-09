require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  resources :search, only: :index
  resources :users, except: :show do
    member do
      post :follow
      post :stop_following
    end

    resources :pictures
    resources :albums
    resources :likes
  end

  resources :user_avatars, only: [:edit, :update]

  resources :albums, except: :show do
    resources :pictures
  end

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

  resource :foundations, only: [] do
    get :elements
  end
  root to: 'pictures#index'
end
