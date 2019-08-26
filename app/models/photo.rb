class Photo < ApplicationRecord
  belongs_to :item
  mount_uploader :img_list,ImageUploader
end
