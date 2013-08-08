require 'sidekiq/web'
ArtOverflow::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Sidekiq::Web => '/sidekiq'

  unless Rails.env.production?
    devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
    resources :users do
     member do
        post :follow
        post :stop_following
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
    resources :comments, only: [:destroy]
  else
    devise_for :users, only: :sessions
    resources :pictures
    resources :activities
  end

  resources :subscribers, only: [:index, :create] do
    get :unsubscribe, on: :member
  end

  resources :ping, only: :index
  root to: 'subscribers#index'
end
