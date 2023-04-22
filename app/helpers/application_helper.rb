module ApplicationHelper
  def total_price_recipe(recipe)
    total_price = 0
    recipe_ingredients = RecipeFood.includes([:food]).where(recipe:)
    recipe_ingredients.each do |ingredient|
      total_price += ingredient.food[:price] * ingredient[:quantity]
    end
    total_price
  end

  def total_ingredients_recipe(recipe)
    total_ingredients = 0
    recipe_ingredients = RecipeFood.includes([:food]).where(recipe:)
    recipe_ingredients.each do |ingredient|
      total_ingredients += 1 if ingredient
    end
    total_ingredients
  end
end
