class Item < ApplicationRecord

  has_one :user
  has_one :item_transaction
  has_one_attached :image

  validates :text, presence: true
  validates :self.image.attached?, presence: true
end
