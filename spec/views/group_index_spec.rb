require 'rails_helper'

RSpec.describe 'Group index page', type: :feature do
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
    click_link 'Show groups'
  end

  describe 'shows the page' do
    it 'with all groups in it' do
      expect(page).to have_content(@group1.name)
      expect(page).to have_content(@group2.name)
    end

    it 'shows the total amount of money for all groups' do
      expect(page).to have_content('Total amount:')
    end

    it 'shows the creation button for groups and entities' do
      expect(page).to have_content('Create group')
    end
  end
end
