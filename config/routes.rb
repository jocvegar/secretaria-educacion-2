Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
  get '/offline.html' => "service_worker#offline"

  resources :users, only: [:index, :edit, :update, :destroy]
  resources :teams

end
