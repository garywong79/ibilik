get "/login" do

erb :"user/login"

end

post "/login" do
	
	 if user = User.authenticate(params[:user][:email],params[:user][:password])
		session[:user_id] = user.id
		redirect to "/"
	else
		@login_error = "Invalid Login"
		erb :"user/login"
	end

end

get "/users/:user_id" do

erb :"user/profile"
end
