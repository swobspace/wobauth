Wobauth::Engine.routes.draw do
  devise_for :users, class_name: "Wobauth::User"
  resources :authorities

  resources :memberships

  resources :groups

  resources :roles

end
