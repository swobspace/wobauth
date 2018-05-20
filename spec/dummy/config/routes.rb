Rails.application.routes.draw do

  resources :categories do
    resources :authorities, module: :categories
  end

  resources :posts

  root 'home#index'
  get '/home', to: "home#index", as: :home
  get '/home/index'

  mount Wobauth::Engine => "/auth"
end
