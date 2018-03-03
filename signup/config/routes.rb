Rails.application.routes.draw do
  mount Dashing::Engine, at: Dashing.config.engine_path
  #get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  #get 'admin/index'
  resources :sessions do 
  collection do
    get :new
  end
end
resources :users do 
  collection do
    get :new
  end
end
resources :users do 
  collection do
    post :new
  end
end
  resources :users

  get 'admin' => 'admin#index'
  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end
root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
