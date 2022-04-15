# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes#show', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')
      @user2 = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')
      @user3 = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')

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
      @recipe1.save!

      visit recipe_path(@recipe1)
    end

    it 'shows recipe name' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.name)
    end

    it 'shows recipe has prepration time' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.prepration_time)
    end

    it 'shows recipe has cooking time' do
      recipe = Recipe.first
      expect(page).to have_content(recipe.cooking_time)
    end
  end
end
