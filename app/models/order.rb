class Order < ActiveRecord::Base
	has_many :items
	belongs_to :user

	serialize :order_items, Hash
end
