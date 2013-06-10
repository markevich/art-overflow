require 'sidekiq/web'
ArtOverflow::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  unless Rails.env.production?
    resources :users do
     member do
        post :follow
        post :stop_following
      end
    end
    resources :activities
    resources :pictures do
      member do
        post :like
        post :unlike
      end
    end
    devise_for :users
  else
    devise_for :users, only: :sessions
  end

  resources :subscribers, only: [:index, :create]
  root to: 'subscribers#index'
end
