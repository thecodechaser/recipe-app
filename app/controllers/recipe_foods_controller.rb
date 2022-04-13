# frozen_string_literal: true

class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe_id = params[:recipe_id]
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), flash: { alert: 'Your food is saved' }
    else
      redirect_to new_recipe_recipe_food_path, flash: { alert: 'Could not save your food' }
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy!
    flash[:notice] = 'You have deleted the recipe food!'
    redirect_to recipe_path(params[:recipe_id])
  end

  def edit
    @recipe_id = params[:recipe_id]
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(edit_recipe_food_params)
    flash[:notice] = 'You have updated the recipe food successfully'
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def edit_recipe_food_params
    params.require(:edit_recipe_food).permit(:quantity, :food_id)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
