class OrderPurchase
  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city, :address, :billing_address_line, :phone_number, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :token
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Not include hyphen(-)' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(post_number: post_number, prefecture_id: @prefecture_id, city: city, address: address, billing_address_line: billing_address_line, phone_number: phone_number, purchase_id: purchase.id)
  end
end
