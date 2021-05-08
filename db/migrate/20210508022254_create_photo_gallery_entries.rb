class CreatePhotoGalleryEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_gallery_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.integer :likes_count, null: false, default: 0
      t.integer :views_count, null: false, default: 0

      t.timestamps
    end
  end
end
