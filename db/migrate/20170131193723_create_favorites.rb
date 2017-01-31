class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
    	t.integer  :user_id
      t.references :favoriteable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
