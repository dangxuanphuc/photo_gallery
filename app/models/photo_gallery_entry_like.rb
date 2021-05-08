class PhotoGalleryEntryLike < ApplicationRecord
  belongs_to :photo_gallery_entry
  counter_culture :photo_gallery_entry, column_name: "likes_count"

  validates_uniqueness_of :browser_uid, scope: :photo_gallery_entry_id
end
