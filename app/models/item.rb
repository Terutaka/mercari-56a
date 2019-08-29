class Item < ApplicationRecord
  has_many   :photos
  belongs_to :category
  belongs_to :fee_side
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  accepts_nested_attributes_for :photos
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :brand , optional: true

  validates :saler_id,presence: true
  validates :name,presence: true, length: {maximum: 30}
  validates :explain,presence: true, length: {maximum: 1000}
  validates :category_id,presence: true
  validates :state_id,presence: true
  validates :fee_side_id,presence: true
  validates :shipping_date_id,presence: true
  validates :prefecture_id,presence: true
  validates :price,presence: true, numericality: true,inclusion: { in: 300..9999999}
  validates :photos,presence: true
end
