class CreatePhotoGalleryEntryLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_gallery_entry_likes do |t|
      t.references :photo_gallery_entry, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :browser_uid, null: false
      t.string :ip_address
      t.text :user_agent, size: :long

      t.timestamps
    end
    add_index :photo_gallery_entry_likes, [:photo_gallery_entry_id, :browser_uid], unique: true
  end
end
