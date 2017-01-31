class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string   :title
      t.integer  :user_id
      t.integer  :album_id
      t.integer  :track_num
      t.integer  :length

      t.timestamps
    end
  end
end
