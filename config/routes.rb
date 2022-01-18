Rails.application.routes.draw do

  resources :guests, only: [ :index ]
  resources :episodes, only: [ :index, :show, :destroy ]
  resources :appearances, only: [ :create ]
  
end
