class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :mail

      t.timestamps
    end
  end
end
