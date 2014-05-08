Wobauth::Engine.routes.draw do
  devise_for :users, class_name: "Wobauth::User", module: :devise

  resources :authorities

  resources :memberships

  resources :groups

  resources :roles

end
