class ItemProcedure
  
  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city, :address, :billing_address_line, :phone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{7}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with:　/\A[ぁ-んァ-ン一-龥]/, message: "can't be blank"} #カタカナの市もあるので/\A[ぁ-んァ-ン一-龥]/を採用
    validates :address, format: { with: [/^ \t\f\r\n/], message: "can't be blank"}
    validates :phone_number, format: {{ with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)" }}
  end
    #billing_address_lineは空でも差し支えないのでバリデーションは設けていない

  def save
    Purchase.create(user_id: current_user.id, item_id: item.id)
    Order.create(token: , post_number: post_number, prefecture_id: prefecture, city: city, address: address, billing_address_line: billing_address_line, phone_number: phone_number, purchase_id: purchase.id)
  end
end