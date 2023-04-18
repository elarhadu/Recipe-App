# app/models/food.rb
class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_