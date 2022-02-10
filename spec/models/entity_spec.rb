require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    Entity.create!(name: 'Entity 1', amount: 100,
                   user: User.new(name: 'Jhon', email: 'test@test.com', password: '123456'))
  end

  describe 'Entity model' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      expect(subject.name).not_to be_nil
    end

    it 'should have an amount' do
      expect(subject.amount).not_to be_nil
      expect(subject.amount).to be_a(Integer)
      expect(subject.amount).to be > 0
    end
  end
end
