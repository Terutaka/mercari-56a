class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_detail
  has_many :buying_items, class_name: "Item", foreign_key: "buyer_id"
  has_one :card
  has_one :user_detail
  accepts_nested_attributes_for :user_detail
end
