Starboundplanets::Application.routes.draw do
  devise_for :users

  resources :sectors, :systems, :clusters, :planets

  resources :home, only: [:welcome]

  # resources :sectors, only: [:index, :show] do
  #   resources :systems, only: [:index, :new, :create]
  # end

  # resources :systems, only: [:show, :edit, :update] do
  #   resources :clusters, only: [:index, :new, :create]
  # end

  # resources :clusters, only: [:show, :edit, :update] do
  #   resources :planets, only: [:index, :new, :create]
  # end

  # resources :planets, only: [:show, :edit, :update]

  resources :users, only: [] do
    resources :planets, only: [:index]
  end

  resources :planets, only: [] do
    resources :ratings, only: [:create]
  end


  get 'sector/:sector_id/new', to: 'systems#new', as: 'new_sector_system'

  get 'system/:system_id/new', to: 'clusters#new', as: 'new_system_cluster'

  get 'cluster/:cluster_id/new_planet', to: 'planets#new', as: 'new_cluster_planet'

  get '/welcome', to: 'home#welcome', as: 'welcome'

  root 'home#home'
end
