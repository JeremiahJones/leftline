class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ### ASSOCIATIONS
  has_many :game_configurations
end
