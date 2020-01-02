class AddVersionToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :version, :string
  end
end
