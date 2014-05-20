class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transaccions do |t|
      t.integer :client_id
      t.integer :order_id
      t.boolean :payed
      t.string :detail
      t.string :pay_method
      t.string :status
      t.string :authorization_code
      t.string :paydate
      t.string :gateway_id
      t.decimal :total

      t.timestamps
    end
  end
end
