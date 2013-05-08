require 'sidekiq/web'
ArtOverflow::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}
  resources :drawings
  resources :invites, only: [:index, :create]
  root to: 'drawings#index'
end
