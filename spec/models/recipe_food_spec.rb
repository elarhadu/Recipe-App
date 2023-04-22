require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.create(name: 'Jane Doe')
    @food = Food.create(name: 'flour', measurement_unit: 'grams', price: 2, quantity: 15, user_id: @user.id)
    @recipe = Recipe.create(name: 'Pancakes', description: 'Delicious pancakes', user_id: @user.id)
    RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 2)
  end

  before { subject.save }

  it 'Quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'Quantity should be greater than or equal to 0' do
    subject.quantity = -2
    expect(subject).to_not be_valid
  end

  it 'Recipe should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'Food should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end
end
