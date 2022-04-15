# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    if !current_user
      redirect_to recipes_path, flash: { alert: 'Please sign up or login!' }
    end
    
    @recipe = Recipe.new
  end

  def create
    @new_recipe = current_user.recipes.new(recipe_params)
    if @new_recipe.save!
      redirect_to recipes_path, flash: { alert: 'Your recipe is saved' }
    else
      redirect_to new_recipe_path, flash: { alert: 'Could not save your recipe' }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = 'You have deleted the food!'
    redirect_to recipes_path
  end

  def update
    if !current_user
      redirect_to recipe_path(params[:id]), flash: { alert: 'Please sign up or login!' }
  else 

    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = 'You have updated the recipe status to private'
    else
      @recipe.update(public: true)
      flash[:notice] = 'You have updated the recipe status to public'
    end
    redirect_to recipe_path
  end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description)
  end
end
