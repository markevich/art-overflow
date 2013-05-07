ArtOverflow::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}
  resources :drawings
  resources :invites, only: [:index, :create]
  root to: 'drawings#index'
end
