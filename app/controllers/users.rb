get "/signup" do
	

	erb :"users/signup"
end

post "/signup" do

	@user = User.new(params[:user])

	if @user.save 
		@signup_succ = "You may login now!"
		redirect to "/?signup_succ=#{@signup_succ}"
	else
		erb :"users/signup"
	end

end

get "/users/:user_id" do

@booking = Booking.find_by(user_id: current_user.id)
erb :"users/profile"
end

delete "/logout" do 
	session[:user_id] = nil
	redirect to "/"
end
