class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, length: { maximum: 255 }, presence: true 
end
