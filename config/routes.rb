Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :users do
  	get :tweets
  end
	root 'tweets#index'
  resources :tweets

  match "/404" => "errors#not_found", via: :all
  match "/500" => "errors#exception", via: :all
end
