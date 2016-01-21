class Request < ActiveRecord::Base
	has_one :location 
	has_many :quotes
end
