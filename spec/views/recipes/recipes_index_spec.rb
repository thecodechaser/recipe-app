# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes#index', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @recipe1 = Recipe.new(user: @user, name: 'Recipe 1', prepration_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe2 = Recipe.new(user: @user, name: 'Recipe 2', prepration_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe3 = Recipe.new(user: @user, name: 'Recipe 3', prepration_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')
      @recipe4 = Recipe.new(user: @user, name: 'Recipe 4', prepration_time: '25 minutes', cooking_time: '50 minutes',
                            description: 'It is a delicious meal')

      visit(recipes_path)
    end

    it 'shows the recipe name' do
      expect(page).to have_content('All Recipes')
    end
  end
end
