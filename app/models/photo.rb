class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  scope :user_photos, ->(user_id) { where('user_id = ?', user_id) }
end
