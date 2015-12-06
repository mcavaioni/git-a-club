require 'spec_helper'

RSpec.describe User do 
  describe 'user validations' do
    let(:user) {FactoryGirl.build :user}

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
  end
end