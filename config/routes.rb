require 'sidekiq/web'
ArtOverflow::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  resources :users do
  	member do
      post :follow
      post :stop_following
  	end
  end
  resources :activities
  resources :pictures
  resources :subscribers, only: [:index, :create]
  root to: 'subscribers#index'
end
