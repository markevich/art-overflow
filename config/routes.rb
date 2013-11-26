require 'sidekiq/web'
ArtOverflow::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  resources :users do
    member do
      post :follow
      post :stop_following
    end

    resources :pictures do
      get :latest, on: :collection
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

  resources :subscribers, only: [:index, :create] do
    get :unsubscribe, on: :member
  end

  resources :ping, only: :index

  resource :foundations, only: [] do
    get :elements
  end
  root to: 'subscribers#index'
end
