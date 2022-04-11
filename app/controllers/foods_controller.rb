class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @new_food = current_user.foods.new(food_params)
    if @new_food.save
      redirect_to foods_path, flash: { alert: 'Your food is saved' } 
    else
      redirect_to new_food_path, flash: { alert: 'Could not save your food' }
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
