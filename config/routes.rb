require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  resources :search, only: :index
  resources :users do
    member do
      post :follow
      post :stop_following
      get :avatar_edit
      patch :avatar_update
    end

    resources :pictures do
      get :latest, on: :collection
      # get :latest_list, on: :collection
      get :popular, on: :collection
      # get :popular_list, on: :collection
    end
  end
  resources :comments do
    member do
      post :like
      post :unlike
    end
  end
  resources :galleries
  resources :activities
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
