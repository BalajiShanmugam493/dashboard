Rails.application.routes.draw do
 
  
  resources :products

  root to: 'products#index'

  resources :userrolemaps

  root to: 'userrolemaps#index'

 


  

  get "/path/to/your/tdk/page", to: "userrolemaps#tdk", as: "tdk"

  get "/path/to/your/qc/page", to: "userrolemaps#qc", as: "qc"

  get "/path/to/your/funding/page", to: "userrolemaps#funding", as: "funding"

  get "/path/to/your/dispatched/page", to: "userrolemaps#dispatched", as: "dispatched"
end