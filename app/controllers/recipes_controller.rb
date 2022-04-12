class RecipesController < ApplicationController

def index
  @recipes = Recipe.all
end

def create
  @new_recipe = current_user.recipes.new(recipe_params)
  if @new_recipe.save!
    redirect_to recipes_path, flash: { alert: 'Your recipe is saved' }
  else 
    redirect_to new_recipe_path, flash: { alert: 'Could not save your recipe' }
  end
end

private

def recipe_params
  params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description)
end

end