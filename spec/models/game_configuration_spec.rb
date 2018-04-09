require 'rails_helper'

describe GameConfiguration, type: :model do
  it { should belong_to(:user) }

  context 'validate validations' do
    before do
      @game_configuration = create(:valid_config)
    end

    it 'is valid with valid attributes' do
      expect(@game_configuration).to be_valid
    end

    it 'is not valid without a game' do
      @game_configuration.game = nil
      expect(@game_configuration).to_not be_valid
    end
  end
end
