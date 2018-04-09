class CreateDefaultSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :default_settings do |t|
      t.string :game
      t.json :settings

      t.timestamps
    end
  end
end
