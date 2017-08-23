class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :album
      t.string :title
      t.string :year
      t.string :record_condition

      t.timestamps
    end
  end
end
