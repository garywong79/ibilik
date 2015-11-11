get "/properties/:id/bookings/new" do
	@property = Property.find_by(id: params[:id])
	erb :"bookings/new_booking"
end

post "/properties/:id/bookings" do
	@property = Property.find_by(id: params[:id])
	@booking = @property.bookings.new(booking_date: params[:booking][:booking_date], booking_detail: params[:booking][:booking_detail], user_id: current_user.id)


	if @booking.save
		redirect to "/properties/#{@property.id}"
	else
		erb :"bookings/new_booking"
	end
end

get "/bookings/:id" do
	@booking = Booking.find_by(id: params[:id])
	
	erb :"bookings/show_booking"
end

get "/bookings/:id/edit" do

	@booking = Booking.find_by(id: params[:id])
	erb :"bookings/edit_booking"
end

put "/bookings/:id/update" do
	
	@booking = Booking.find_by(id: params[:id])
	@booking.booking_date = params[:booking][:booking_date]
	@booking.booking_detail = params[:booking][:booking_detail]

	if @booking.save
		redirect to "/properties/#{@booking.property.id}"
	else
		erb :"bookings/edit_booking"
	end

end

delete "/bookings/:id" do
	@booking = Booking.find_by(id: params[:id])
	@booking.destroy
	redirect to "/properties/#{@booking.property.id}"
end

