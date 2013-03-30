ArtOverflow::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}
  resources :drawings
  root to: 'drawings#index'
end
