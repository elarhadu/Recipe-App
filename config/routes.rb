Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  resources :foods, only: [:index] do
    resources :recipes, only: [:index] do
      resources :recipe_foods, only: [:index]
    end
  end
end
