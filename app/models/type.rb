class Type < ApplicationRecord
  has_many :books
  validates :typeofbook, presence:true
end
