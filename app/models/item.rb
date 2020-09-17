class Item < ApplicationRecord

  has_one :user
  has_one :item_transaction
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :take

  validates :image, presence: true
  validates :name, :info, :category, :state, :charge, :from, :take, :price, presence: true
  validates :category_id, :state_id, :chage_id, :prefecture_id, :take_id, numericality: { other_than: 1 } 
  validates :price, numericality: { only_integer: true, greater_than:300, less_than:9999999 }
    
end
