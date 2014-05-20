class Client < ActiveRecord::Base
has_many :addresses, dependent: :destroy
has_many :transaccions, dependent: :destroy
has_many :orders, dependent: :destroy
accepts_nested_attributes_for :addresses

end
