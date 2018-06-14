class Product < ApplicationRecord
  has_many :order_items
  attr_accessor :image
  mount_uploaders :image, ImageUploader
  serialize :image
end
