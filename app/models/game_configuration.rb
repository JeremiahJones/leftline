class GameConfiguration < ApplicationRecord
  ### ASSOCIATIONS
  belongs_to :user
  ### VALIDATIONS
  validates_presence_of :game
end
