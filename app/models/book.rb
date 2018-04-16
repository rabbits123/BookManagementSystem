class Book < ApplicationRecord
  belongs_to :user
  belongs_to :type
  validates :title, presence: true
  mount_uploader :book_image, BookImageUploader
end
