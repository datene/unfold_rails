class FeaturedUser < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
