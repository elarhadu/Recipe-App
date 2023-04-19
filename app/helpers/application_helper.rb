module ApplicationHelper
  def food_items(recipe_food)
    quantity = recipe_food.quantity - recipe_food.food.quantity
    return unless quantity.positive?

    { name: recipe_food.food.name, quantity: "#{quantity} #{recipe_food.food.measurement_unit}",
      price: recipe_food.food.price * quantity }
  end

  def total_price(recipe_foods)
    total_price = 0
    recipe_foods.each do |food|
      next unless food_items(food)

      total_price += food_items(food)[:price]
    end
    total_price
  end

  def total_ingredients(recipe_foods)
    total_ingredients = 0
    recipe_foods.each do |food|
      total_ingredients += 1 if food_items(food)
    end
    total_ingredients
  end

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
