Rails.application.routes.draw do
  use_doorkeeper
  resources :users do
  	put :follow
  	put :unfollow
  end
	root 'tweets#index'
  resources :tweets

  match "/404" => "errors#not_found", via: :all
  match "/500" => "errors#exception", via: :all
end
