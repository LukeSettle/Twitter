Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :users
	root 'tweets#index'
  resources :tweets
end
