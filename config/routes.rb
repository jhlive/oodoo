Rails.application.routes.draw do
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
