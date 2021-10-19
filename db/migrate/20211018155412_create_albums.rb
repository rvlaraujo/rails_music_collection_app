class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
