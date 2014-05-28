class AddParamterstoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :washer_size, :string
	add_column :products, :bolt_size_metric, :string
	add_column :products, :bolt_size_unc, :string
	add_column :products, :diameter_inside, :decimal
	add_column :products, :diameter_outside, :decimal
	add_column :products, :thickness_T, :decimal
	add_column :products, :min_package, :integer
	add_column :products, :weight, :decimal
	add_column :products, :art_no, :integer
  end
end
