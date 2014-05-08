Rails.application.routes.draw do

  root 'home#index'
  get '/home', to: "home#index", as: :home
  get '/home/index'

  mount Wobauth::Engine => "/auth"
end
