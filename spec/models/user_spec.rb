require 'spec_helper'

RSpec.describe User do 
  describe 'validations' do
    # let(:user) {FactoryGirl.create :user}
    before(:each) do
      @user =  User.create(first_name: 'HoWon', last_name: 'Cheng', address: '11 Broadway', email: 'test@test.com', phone_number:'123-456-7890', password_digest: 'password123')
    end

    it 'validates user first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'validates user last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'validates user email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'validates user email uniqueness' do
      @user.save
      expect(User.create(first_name: 'HoWon', last_name: 'Cheng', email: 'test@test.com', password_digest: 'password123')).to_not be_valid
    end
  end

  describe 'being a supplier' do
    context 'cannot be a supplier without address and phone number' do
      # before(:each) do
      #   @valid_user = User.create(first_name: 'HoWon', last_name: 'Cheng', address: '11 Broadway', email: 'test1@test.com', phone_number:'123-456-7890', password_digest: 'password123')
      #   @no_address_user = User.create(first_name: 'Michael', last_name: 'Cavaioni', email: 'test2@test.com', phone_number:'123-456-7890', password_digest: 'password123')
      #   @no_phone_user = User.create(first_name: 'Avi', last_name: 'Turkewitz', address: '11 Broadway', email: 'test3@test.com', password_digest: 'password123')
      #   @no_address_no_phone_user = User.create(first_name: 'Jay', last_name: 'Ribakove', email: 'test4@test.com', password_digest: 'password123')
      # end

      before(:each) do
        visit '/users/new'
        within('#new_user') do
          fill_in 'First Name', :with => 'HoWon'
          fill_in 'Last Name', :with => 'Cheng'
          fill_in 'Password', :with => 'password123'
          fill_in 'Password confirmation', :with => 'password123'
        end
      end

      it '#supplier returns not nil for user with address and phone number' do
        within('#new_user') do
          fill_in 'Email', :with => 'test1@test.com'
          fill_in 'Address', :with => '11 Broadway'
          fill_in 'Phone number', :with => '123-456-7890'
        end
        click_button 'Create User'
        @valid_user = User.last
        expect(@valid_user.supplier).to_not be_nil
      end

      it '#supplier returns nil for user without address' do
        within('#new_user') do
          fill_in 'Email', :with => 'test2@test.com'
          fill_in 'Phone number', :with => '123-456-7890'
        end
        click_button 'Create User'
        @no_address_user = User.last
        expect(@no_address_user.supplier).to be_nil
      end

      it '#supplier returns nil for user without phone number' do
        within('#new_user') do
          fill_in 'Email', :with => 'test3@test.com'
          fill_in 'Address', :with => '11 Broadway'
        end
        click_button 'Create User'
        @no_phone_user = User.last
        expect(@no_phone_user.supplier).to be_nil
      end

      it '#supplier returns nil for user without phone number' do
        within('#new_user') do
          fill_in 'Email', :with => 'test4@test.com'
        end
        click_button 'Create User'
        @no_address_no_phone_user = User.last
        expect(@no_address_no_phone_user.supplier).to be_nil
      end
    end
  end
end