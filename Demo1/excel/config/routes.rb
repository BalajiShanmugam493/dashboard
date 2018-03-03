Rails.application.routes.draw do
 
  get 'userrolemaps/show'

  #resources :users

  
  #root to: 'users#new'
  
  resources :sessions
  root to:'sessions#login'

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
   get "/path/to/your/tdk_operators/page", to: "userrolemaps#tdk_operators", as: "tdk_operators"

   get "/path/to/your/funding_operators/page", to: "userrolemaps#funding_operators", as: "funding_operators"

   get "/path/to/your/qc_operators/page", to: "userrolemaps#qc_operators", as: "qc_operators"
     get "/path/to/your/qcd_operators/page", to: "userrolemaps#qcd_operators", as: "qcd_operators"

   get "/path/to/your/authors_operators/page", to: "userrolemaps#authors_operators", as: "authors_operators"

  get "/path/to/your/addresses_operators/page", to: "userrolemaps#addresses_operators", as: "addresses_operators"
   

  get "/path/to/your/qc/page", to: "userrolemaps#qc", as: "qc"
    get "/path/to/your/qcd/page", to: "userrolemaps#qcd", as: "qcd"

  get "/path/to/your/funding/page", to: "userrolemaps#funding", as: "funding"

  get "/path/to/your/dispatched/page", to: "userrolemaps#dispatched", as: "dispatched"
get "/path/to/your/dispatchedd/page", to: "userrolemaps#dispatchedd", as: "dispatchedd"
  
   # post "/path/to/your/dispatched/page", to: "userrolemaps#dispatched", as: "dispatched"

	get "/path/to/your/welcome/page", to: "userrolemaps#welcome", as: "welcome"
	get "/path/to/your/index1/page", to: "userrolemaps#index1", as: "index1"

	get "/path/to/your/authors/page", to: "userrolemaps#authors", as: "authors"

	get "/path/to/your/addresses/page", to: "userrolemaps#addresses", as: "addresses"
  root :to => "sessions#login"
match "signup", :to => "users#new", via: [:get, :post]
match "login", :to => "sessions#login",via: [:get, :post]
match "logout", :to => "sessions#logout",via: [:get, :post]
match "home", :to => "sessions#home",via: [:get, :post]
match "profile", :to => "sessions#profile",via: [:get, :post]
match "setting", :to => "sessions#setting",via: [:get, :post]
match "dispatched", :to=> "userrolemaps#dispatched", via: [:get, :post]
end