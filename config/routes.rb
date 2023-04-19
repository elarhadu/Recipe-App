Rails.application.routes.draw do
  devise_for :users
  
  root 'foods#index'
  resources :foods
end
