# frozen_string_literal: true

class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    redirect_to foods_path, flash: { alert: 'Please sign up or login!' } unless current_user

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

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    flash[:notice] = 'You have deleted the food!'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
