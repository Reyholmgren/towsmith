class Provider < ActiveRecord::Base
	has_many :quotes
	has_many :locations
	has_one :quote_table
	delegate :tow_truck, :locksmith
end
