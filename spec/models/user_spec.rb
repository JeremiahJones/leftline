require 'rails_helper'

describe User, type: :model do
  it { should have_many(:game_configurations) }

  context 'validate validations' do
    before do
      @user = create(:valid_user)
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
end
