Rails.application.routes.draw do

  resources :users do
    member do
      get 'edit_email'
      get 'edit_password'
      put 'update_email'
      put 'update_password'
    end
  end
  resources :episodes
  resources :leagues
  resources :league_memberships, only: :create
  resources :actors
  resources :teams
  resources :team_memberships, only: :create
  resources :writeups, only: [:new, :create, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
  get 'faq', to: 'static_pages#faq'
end
