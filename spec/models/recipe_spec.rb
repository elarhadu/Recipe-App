require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Jane Doe')
    @recipe = Recipe.new(name: 'Pancakes', description: 'A classic breakfast dish', user_id: @user.id)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should have valid value' do
    @food1 = Food.create(name: 'Flour', measurement_unit: 'cups', price: 2, quantity: 15, user_id: @user.id)
    @food2 = Food.create(name: 'Eggs', measurement_unit: 'units', price: 1, quantity: 10, user_id: @user.id)
    @recipe.recipe_foods.new(food_id: @food1.id, quantity: 200)
    @recipe.recipe_foods.new(food_id: @food2.id, quantity: 3)
    expect(subject.name).to eql 'Pancakes'
  end

  it 'Should have many recipe foods' do
    @food1 = Food.create(name: 'Flour', measurement_unit: 'cups', price: 2, quantity: 15, user_id: @user.id)
    @food2 = Food.create(name: 'Eggs', measurement_unit: 'units', price: 1, quantity: 10, user_id: @user.id)
    @recipe_food1 = @recipe.recipe_foods.new(food_id: @food1.id, quantity: 200)
    @recipe_food2 = @recipe.recipe_foods.new(food_id: @food2.id, quantity: 3)
    expect(subject.recipe_foods).to include(@recipe_food1)
    expect(subject.recipe_foods).to include(@recipe_food2)
  end
end
