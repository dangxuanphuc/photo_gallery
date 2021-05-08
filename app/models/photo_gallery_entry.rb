class PhotoGalleryEntry < ApplicationRecord
  has_many :photo_gallery_entry_likes
  has_many :photo_gallery_entry_views

  scope :sort_by_created_at, -> { order created_at: :desc }
end
