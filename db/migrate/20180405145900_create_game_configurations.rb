class CreateGameConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :game_configurations do |t|
      t.belongs_to :user
      t.string :game
      t.json :settings

      t.timestamps
    end
  end
end
