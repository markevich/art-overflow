require 'sidekiq/web'
ArtOverflow::Application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  unless Rails.env.production?
    devise_for :users
    resources :users do
     member do
        post :follow
        post :stop_following
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
  else
    devise_for :users, only: :sessions
  end

  resources :subscribers, only: [:index, :create] do
    get :unsubscribe, on: :member
  end

  resources :ping, only: :index
  root to: 'subscribers#index'
end
