class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_many :comments
	belongs_to :user
	has_many :bookings

	validates :property_description, presence:true


end
