require 'spec_helper'

RSpec.describe User do 
  describe 'validations' do
    let(:user) {FactoryGirl.create :user}

    it 'validates user first name' do
      expect(user).to be_valid
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'validates user last name' do
      expect(user).to be_valid
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'validates user email' do
      expect(user).to be_valid
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'validates user email uniqueness' do
      expect(User.create(first_name: 'HoWon', last_name: 'Cheng', email: 'test@test.com', password_digest: 'password123')).to_not be_valid
    end
  end

  describe 'being a supplier' do
    context 'cannot be a supplier without address and phone number' do
      before(:each) do
        @valid_user = User.create(first_name: 'HoWon', last_name: 'Cheng', address: '11 Broadway', email: 'test1@test.com', phone_number:'123-456-7890', password_digest: 'password123')
        @no_address_user = User.create(first_name: 'Michael', last_name: 'Cavaioni', email: 'test2@test.com', phone_number:'123-456-7890', password_digest: 'password123')
        @no_phone_user = User.create(first_name: 'Avi', last_name: 'Turkewitz', address: '11 Broadway', email: 'test3@test.com', password_digest: 'password123')
        @no_address_no_phone_user = User.create(first_name: 'Jay', last_name: 'Ribakove', email: 'test4@test.com', password_digest: 'password123')
      end

      it '#supplier returns not nil for user with address and phone number' do
        expect(@valid_user.supplier).to_not be_nil
      end

      it '#supplier returns nil for user without address' do
        expect(@no_address_user).to be_nil
      end

      it '#supplier returns nil for user without phone number' do
        expect(@no_phone_user).to be_nil
      end

      it '#supplier returns nil for user without phone number' do
        expect(@no_address_no_phone_user).to be_nil
      end
    end
  end

end