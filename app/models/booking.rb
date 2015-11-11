class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :property
	belongs_to :user

	validates :booking_date, presence:true
end
