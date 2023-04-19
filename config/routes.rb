Rails.application.routes.draw do
  devise_for :users
  
  root 'foods#index'
  resources :foods
   resources :recipes
  resources :recipe_foods
  resources :recipes do 
    resources :recipe_foods
  end
end
