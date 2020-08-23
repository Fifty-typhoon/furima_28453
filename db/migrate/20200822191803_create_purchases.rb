class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true#ロールバック後、itemsテーブルの作成
      t.timestamps
    end
  end
end
