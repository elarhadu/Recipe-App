Rails.application.routes.draw do
  devise_for :users
  
  root 'foods#index'
  resources :foods
   resources :recipes
  resources :recipe_foods
  resources :recipes do 
    resources :recipe_foods
  end
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

end
