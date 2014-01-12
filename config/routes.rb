Starboundplanets::Application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :sectors, :systems, :clusters, :asteroid_fields, :moons, :planets

  get 'sector/:sector_id/new', to: 'systems#new', as: 'new_sector_system'

  get 'system/:system_id/new', to: 'clusters#new', as: 'new_system_cluster'

  get 'cluster/:cluster_id/new_asteroid', to: 'asteroid_fields#new', as: 'new_cluster_asteroid_field'

  get 'cluster/:cluster_id/new_moon', to: 'moons#new', as: 'new_cluster_moon'

  get 'cluster/:cluster_id/new_planet', to: 'planets#new', as: 'new_cluster_planet'

  root 'home#welcome'
end
