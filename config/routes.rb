require 'sidekiq/web'
ArtOverflow::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  resources :activities
  resources :pictures
  resources :invites, only: [:index, :create]
  root to: 'pictures#index'
end
