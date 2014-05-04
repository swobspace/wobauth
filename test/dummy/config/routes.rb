Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  get '/home', to: "home#index", as: :home
  get '/home/index'

  mount Wobauth::Engine => "/auth"
end
