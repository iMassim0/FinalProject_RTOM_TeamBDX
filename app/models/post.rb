class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title,       length: { maximum: 60 },  presence: true
  validates :description, length: { maximum: 255 }, presence: true
  validates :content,                               presence: true
end
