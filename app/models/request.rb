class Request < ActiveRecord::Base
	has_one :location
	has_many :quotes
	belongs_to :users

	def self.descending
		order(created_at: :desc)
	end

end
