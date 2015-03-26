enable :sessions
get '/register' do

erb :register
end

post '/register' do
u = User.find_by(email: params[:user][:email])
	if u.nil?
		@user = User.create(params[:user])
		redirect to '/login'
	else
		@errors = ["Email is already in the system. Try another email"]
		# @errors = @user.errors.full_messages
		erb :register
	end
end

get '/logout' do
	session.clear
	redirect to '/'
end

get '/login' do

erb :login
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])	
 if @user
 	session[:user_id] = @user.id
 	redirect to "/dashboard/#{@user.id}"
 else
 	@errors = ["Authentication failed. Try again"]
 	erb :login
 end
end