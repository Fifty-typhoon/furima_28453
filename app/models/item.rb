class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_from_location
  belongs_to_active_hash :delivery_date
  
  
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category
    validates :state
    validates :delivery_fee
    validates :ship_from_location
    validates :delivery_date
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :ship_from_location_id
    validates :delivery_date_id
  end
end
