Starboundplanets::Application.routes.draw do
  devise_for :users
  resources :sectors, :systems
  get 'sector/:sector_id/new', to: 'systems#new', as: 'new_sector_system'

  root 'home#welcome'
end
