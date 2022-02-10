require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before { visit root_path }

  describe 'splash page' do
    it 'shows the splash page if user not signed in' do
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Log in')
      expect(page).to have_content('MoneyES')
    end
  end

  describe 'login page' do
    before { click_link 'Log in' }
    it 'shows the login page' do
      expect(page).to have_content('Login')
      expect(page).to have_content('Forgot your password?')
      expect(page.has_field?('Email')).to be true
      expect(page.has_field?('Password')).to be true
    end
  end
end
