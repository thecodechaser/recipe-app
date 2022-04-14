# frozen_string_literal: true

class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :recipe_id, presence: true
  validates :food_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
