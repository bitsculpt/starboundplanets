Starboundplanets::Application.routes.draw do
  devise_for :users
  resources :sectors, :systems, :clusters

  get 'sector/:sector_id/new', to: 'systems#new', as: 'new_sector_system'

  get 'system/:system_id/new', to: 'clusters#new', as: 'new_system_cluster'

  root 'home#welcome'
end
