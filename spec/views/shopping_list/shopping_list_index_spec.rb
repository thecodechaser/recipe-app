# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShoppingList#index', type: :feature do
  describe 'Shopping List' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @food1 = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 5)
      @food2 = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 5)
      @food3 = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 5)
      @food4 = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 5)

      visit(shopping_list_index_path)
    end

    it 'Shopping list has food' do
      expect(page).to have_content('Food')
    end

    it 'Shopping list has quantity' do
      expect(page).to have_content('Quantity')
    end

    it 'Shopping list has price' do
      expect(page).to have_content('Price')
    end
  end
end
