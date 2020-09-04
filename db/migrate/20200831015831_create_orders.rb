class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_number,          null: false, default: ""
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false, default: ""
      t.string :address,              null: false, default: ""
      t.string :billing_address_line,              default: ""
      t.string :phone_number,        null: false
      t.references :purchase,         null: false,              foreign_key: true
      t.timestamps
    end
  end
end
