class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc).map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        user: recipe.user.name,
        description: recipe.description,
        food_items: recipe.recipe_foods.count,
        total_price: recipe.foods.map(&:price).sum
      }
    end
  end
end