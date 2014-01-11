Starboundplanets::Application.routes.draw do
  devise_for :users
  resources :sectors

  root 'home#welcome'
end
