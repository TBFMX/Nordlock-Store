class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :cart_id
      t.string :user_id
      t.integer :trans_id
      t.integer :adress_id
      t.string :order_date
      t.string :pay_type
      t.string :details
      t.decimal :price
      t.timestamps
    end
  end
end
