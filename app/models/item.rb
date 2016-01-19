class Item < ActiveRecord::Base

	belongs_to :art
	belongs_to :order

end
