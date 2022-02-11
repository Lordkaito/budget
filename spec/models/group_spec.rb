require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.create!(name: 'Group 1', icon: 'icon.png',
                  user: User.new(name: 'Jhon', email: 'test@test.com', password: '123456'))
  end

  describe 'Group model' do
    it 'should have a name' do
      expect(subject.name).not_to be_nil
    end

    it 'should have an icon' do
      expect(subject.icon).not_to be_nil
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end
