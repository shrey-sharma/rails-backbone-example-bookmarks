class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :address
      t.text :tags

      t.timestamps
    end
  end
end
