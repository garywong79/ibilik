get "/properties/new" do
	
	erb :"properties/new_property"
end

post "/properties" do

	@user = current_user
	@property = @user.properties.new(params[:property])

	if @property.save
		redirect to "/"
	else
		erb :"properties/new_property"
	end

end

get "/properties/:id" do
	@user = User.all
	@property = Property.find_by(id: params[:id])
	@comments = @property.comments
	@bookings = @property.bookings
	erb :"properties/show_property"
end

get "/properties/:id/edit" do
	@property = Property.find_by(id: params[:id])
	erb :"properties/edit_property"
end


put "/properties/:id/update" do 
	@property = Property.find_by(id: params[:id])
	# @question[:question_detail] = params[:question][:question_detail]
	@property.property_description = params[:property][:property_description]
	@property.rental = params[:property][:rental]
	if @property.save
		redirect to "/"
	else
		erb :"properties/edit_property"
	end

end

delete "/properties/:id/delete" do
	@property = Property.find_by(id: params[:id])
	@property.destroy
	redirect "/"
end