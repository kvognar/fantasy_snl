Rails.application.routes.draw do

  resources :users
  resources :episodes
  resources :leagues
  resources :league_memberships, only: :create
  resources :actors
  resources :teams
  resources :writeups, only: [:new, :create, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
end
