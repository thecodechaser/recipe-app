# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Foods#index', type: :feature do
  describe 'Food' do
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

      visit(foods_path)
    end

    it 'shows the food name' do
      expect(page).to have_content('Food')
    end

    it 'shows the food measurment unit' do
      expect(page).to have_content('Measurement Unit')
    end

    it 'shows the food unit price' do
      expect(page).to have_content('Unit Price')
    end

    it 'shows the food actions' do
      expect(page).to have_content('Actions')
    end
  end
end
