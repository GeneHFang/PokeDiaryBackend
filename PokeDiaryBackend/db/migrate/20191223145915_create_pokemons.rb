class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.belongs_to :game
      t.string :img
      t.string :species

      t.timestamps
    end
  end
end
