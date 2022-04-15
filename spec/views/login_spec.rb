# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'displays login button' do
    expect(page).to have_button('Log in')
  end

  context 'Form Submission' do
    scenario 'Submit form without email and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with incorrect email and password' do
      within 'form' do
        fill_in 'Email', with: 'mymail@gmail.com'
        fill_in 'Password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Submit form with correct email and password' do
      @user = User.create(name: 'Ranjeet', email: 'admin@gmail.com', password: 'password')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      expect(page).to have_current_path('/')
    end
  end
  # rubocop:enable Metrics/BlockLength
end
