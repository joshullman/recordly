class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string   :title
      t.integer  :artist_id

      t.timestamps
    end
  end
end
