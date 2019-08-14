class Item < ApplicationRecord
  has_many   :photos
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  accepts_nested_attributes_for :photos
end
