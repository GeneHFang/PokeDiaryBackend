class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.belongs_to :trainer
      t.string :type_of_game

      t.timestamps
    end
  end
end
