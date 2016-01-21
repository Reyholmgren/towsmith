class Location < ActiveRecord::Base
	belongs_to :provider 
	belongs_to :request
end
