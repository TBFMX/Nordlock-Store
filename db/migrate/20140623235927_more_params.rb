class MoreParams < ActiveRecord::Migration
  def change
  	add_column :products, :diameter_inside_unc, :string
	add_column :products, :diameter_outside_unc, :string
	add_column :products, :thickness_T_unc, :string
	add_column :products, :torque, :string
  end
end
