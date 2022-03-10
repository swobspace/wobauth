Wobauth::Engine.routes.draw do

  devise_for :users, path: 'accounts', class_name: "Wobauth::User", module: :devise,
	      controllers: {registrations: 'wobauth/registrations'} 

  resources :users do
    resources :authorities, module: :users
    resources :memberships, module: :users
    collection do
      get :tokens
    end
  end
  resources :ad_users, :only => [:index] do
    collection do
      post :index
    end
  end
  resources :authorities
  resources :memberships
  resources :groups do
    resources :authorities, module: :groups
    resources :memberships, module: :groups
    collection do
      get :tokens
    end
  end
  resources :roles

  get 'login' => 'login#login', as: :login
end
