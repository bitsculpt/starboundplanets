Starboundplanets::Application.routes.draw do
  devise_for :users
  resources :sectors, :systems


  root 'home#welcome'
end
