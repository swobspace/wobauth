Rails.application.routes.draw do

  mount Wobauth::Engine => "/auth"
end
