class Product < ApplicationRecord
  has_many :order_items
  attr_accessor :images
  mount_uploaders :images, ImageUploader
  serialize :avatars
end
