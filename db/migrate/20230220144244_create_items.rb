class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_info
      t.integer :category_id
      t.integer :sales_status_id 
      t.integer :shipping_fee_status_id 
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.integer :item_price
      t.references :user, null: false, foreign_key: true
      t.timestamps 
    end
  end
end
