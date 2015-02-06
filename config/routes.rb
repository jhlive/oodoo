Rails.application.routes.draw do
  
  post "sessions" => "sessions#create", as: :create_session
  delete "sessions" => "sessions#destroy", as: :destroy_session

  resources :devices, except: [:edit, :new] do
  	member do
  		post "lock" => "devices#lock"
  		post "unlock" => "devices#unlock"
  		get "tracking_route" => "devices#tracking_route"
  	end
  	collection do
  		post "track" => "devices#track"
  	end
  end
  root 'home#index'
end
