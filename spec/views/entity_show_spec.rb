require 'rails_helper'

RSpec.describe 'Group show page', type: :feature do
  before do
    visit root_path
    click_link 'Log in'
    @test_user = User.new(id: 1, name: 'Jhon', email: 'test@test.com', password: '123456')
    @test_user.save
    @group1 = Group.create!(name: 'Group 1', icon: 'icon.png', user: @test_user, user_id: 1)
    @group2 = Group.create!(name: 'Group 2', icon: 'icon.png', user: @test_user, user_id: 1)
    @group1.save
    @group2.save
    @entity1 = Entity.create!(name: 'Entity 1', amount: 100, user: @test_user, group: @group1)
    @entity2 = Entity.create!(name: 'Entity 2', amount: 200, user: @test_user, group: @group1)
    @entity1.save
    @entity2.save
    fill_in 'Email', with: @test_user.email
    fill_in 'Password', with: @test_user.password
    click_button 'Log in'
    click_link 'Show entities'
    click_link 'Entity 1'
  end

  describe 'shows only one entity' do
    it 'shows entity names' do
      expect(page).to have_content(@entity1.name)
    end

    it 'entities amount' do
      expect(page).to have_content(@entity1.amount)
    end

    it 'shows entity date' do
      expect(page).to have_content('Date: ')
    end
  end
end
