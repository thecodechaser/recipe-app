# frozen_string_literal: true

class ShoppingListController < ApplicationController
  def index
    @food_amount = 0

    current_user.recipes.each do |recipe|
      @food_amount += recipe.recipe_foods.count
    end

    @total_price = 0

    current_user.recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @total_price += recipe_food.food.price * recipe_food.quantity
      end
    end

    @recipe_foods = []

    current_user.recipes.each do |recipe|
      @recipe_foods.push(recipe.recipe_foods)
    end
  end
end
