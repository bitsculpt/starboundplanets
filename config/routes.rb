Starboundplanets::Application.routes.draw do
  devise_for :users

  root 'home#welcome'
end
