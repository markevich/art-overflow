ArtOverflow::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}
  resources :drawings
  resources :invites, only: [:index, :create]
  root to: 'drawings#index'
end
