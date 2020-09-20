class Item < ApplicationRecord
  belongs_to :user
  # has_one :item_transaction
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :take

  validates :image, presence: true
  validates :name, :info, :price, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :charge_id
    validates :prefecture_id
    validates :take_id
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 1000000 } 
end
