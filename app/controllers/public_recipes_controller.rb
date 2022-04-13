# frozen_string_literal: true

class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc).map do |public_recipe|
      {
        id: public_recipe.id,
        name: public_recipe.name,
        user: public_recipe.name,
        description: public_recipe.description,
        food_items: public_recipe.recipe_foods.count,
        total_price: public_recipe.foods.map(&:price).sum
      }
    end
  end
end
