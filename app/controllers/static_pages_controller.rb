class StaticPagesController < ApplicationController
  def index
    @photo_gallery_entries = PhotoGalleryEntry.all
  end
end
