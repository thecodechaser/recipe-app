class RecipeFoodsController < ApplicationController
  # before_action :set_recipe_food, only: %i[show edit update destroy]
  
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)
    # @new_recipe_food = RecipeFood.new(quantity: params[:quantity], food_id: params[:food_id], recipe_id: @recipe.id)
    if @recipe_food.save
      flash[:notice] = 'Ingredient Added successfully.'
      redirect_to @recipe
    else
      render :new
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_recipe_food
  #   @recipe_food = RecipeFood.find(params[:id])
  # end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end