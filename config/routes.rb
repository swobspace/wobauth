Wobauth::Engine.routes.draw do

  devise_for :users, path: 'accounts', class_name: "Wobauth::User", module: :devise,
	      controllers: {registrations: 'wobauth/registrations'} 

  resources :users
  resources :authorities
  resources :memberships
  resources :groups
  resources :roles

  get 'login/login', as: :login
end
