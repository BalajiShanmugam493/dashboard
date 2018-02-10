Rails.application.routes.draw do
 
  resources :users

  root to: 'users#new'
  

  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'

  resources :products

  root to: 'products#index'

  resources :userrolemaps

  root to: 'userrolemaps#index'

	
	match ':controller/:action/(:id)', via: [:get, :post]
  

  get "/path/to/your/tdk/page", to: "userrolemaps#tdk", as: "tdk"

  get "/path/to/your/qc/page", to: "userrolemaps#qc", as: "qc"

  get "/path/to/your/funding/page", to: "userrolemaps#funding", as: "funding"

  get "/path/to/your/dispatched/page", to: "userrolemaps#dispatched", as: "dispatched"

  root :to => "sessions#login"
match "signup", :to => "users#new", via: [:get, :post]
match "login", :to => "sessions#login",via: [:get, :post]
match "logout", :to => "sessions#logout",via: [:get, :post]
match "home", :to => "sessions#home",via: [:get, :post]
match "profile", :to => "sessions#profile",via: [:get, :post]
match "setting", :to => "sessions#setting",via: [:get, :post]
end