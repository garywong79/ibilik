class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.datetime :booking_date
			t.text :booking_detail
			t.integer :user_id
			t.integer :property_id
			t.timestamps
		end
	end
end
