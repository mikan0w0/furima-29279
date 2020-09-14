class Item < ApplicationRecord
  validates :text, presence: true

  has_one :user
  has_one :item_transaction
  has_one_attached :image
end
