class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :colony
      t.string :cp
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
