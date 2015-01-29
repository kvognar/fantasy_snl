Rails.application.routes.draw do

  resources :users
  resources :episodes
  resources :leagues
  resources :actors
  resources :teams
  resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
end
