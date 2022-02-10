require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jhon', email: 'test@test.com', password: '123456') }
  before { subject.save }

  describe 'User model' do
    it 'should be a valid user' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      expect(subject.name).to eq('Jhon')
    end

    it 'should have an email' do
      expect(subject.email).to eq('test@test.com')
    end

    it 'should have a password' do
      expect(subject.password).not_to be_nil
    end

    it 'should be invalid if no name present' do
      expect(subject.name).not_to be_nil
    end
  end
end
