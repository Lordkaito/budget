require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before do
    visit root_path
    click_link 'Log in'
    @test_user = User.new(id: 1, name: 'Jhon', email: 'test@test.com', password: '123456')
    @test_user.save
    @group1 = Group.create!(name: 'Group 1', icon: 'icon.png', user: @test_user, user_id: 1)
    @group2 = Group.create!(name: 'Group 2', icon: 'icon.png', user: @test_user, user_id: 1)
    @group1.save
    @group2.save
    fill_in 'Email', with: @test_user.email
    fill_in 'Password', with: @test_user.password
    click_button 'Log in'
  end

  describe 'user logged in?' do
    it 'shows index page if user is logged in' do
      expect(page).to have_content('Create group')
    end
  end

  describe 'allows us to see the content' do
    it 'shows the groups' do
      expect(page).to have_content(@group1.name)
      expect(page).to have_content(@group2.name)
    end

    it 'Show the total amount of money for all groups' do
      expect(page).to have_content('Total amount:')
    end
  end
end
