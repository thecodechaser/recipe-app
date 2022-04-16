# frozen_string_literal: true

class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:recipe_foods,
                                      :foods).where(public: true).order(created_at: :desc).map do |public_recipe|
      {
        id: public_recipe.id,
        name: public_recipe.name,
        user: public_recipe.name,
        description: public_recipe.description,
        food_items: public_recipe.recipe_foods.count,
        recipe_foods: public_recipe.recipe_foods
      }
    end

    @total_price = []

    @public_recipes.each do |public_recipe|
      total_price = 0

      public_recipe[:recipe_foods].each do |recipe_food|
        total_price += recipe_food.food.price * recipe_food.quantity
      end
      @total_price.push(total_price)
    end
  end
end
