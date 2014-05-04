Wobauth::Engine.routes.draw do
  resources :authorities

  resources :memberships

  resources :groups

  resources :roles

end
