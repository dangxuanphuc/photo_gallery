class PhotoGalleryEntryView < ApplicationRecord
  belongs_to :photo_gallery_entry
  counter_culture :photo_gallery_entry, column_name: "views_count"
end
