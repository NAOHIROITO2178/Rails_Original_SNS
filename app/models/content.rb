class Content < ApplicationRecord
  attachment :image
  belongs_to :user
  mount_uploader :video, VideoUploader

  with_options presence: true do
    validates :title
    validates :body
    validates :image
    validates :video
  end
end
