class Content < ApplicationRecord
  attachment :image
  belongs_to :user
  has_one_attached :video

  with_options presence: true do
    validates :title
    validates :body
    validates :image
    validates :video
  end
end
