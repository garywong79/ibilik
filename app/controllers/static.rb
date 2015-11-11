get '/' do
	@property = Property.all
	@signup_succ = params[:signup_succ]
	@comment = Comment.all
	@booking = Booking.all
  erb :"static/index"
end