Rails.application.routes.draw do
  devise_for :users
  resources :users
	root 'tweets#index'
  resources :tweets
end
