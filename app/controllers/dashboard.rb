enable :sessions

get '/dashboard/:id' do |id|
	@posts = Post.all
	@user = User.find_by(id: id)
	redirect to "/login" unless session[:user_id] != nil
erb :dashboard
end

post '/dashboard/:id/post/create' do |id|

	if session[:user_id] != nil

		cur_user = User.find(session[:user_id])
		@post = cur_user.posts.create(params[:post])
		tags = params[:tags][:name]
		tags.split(",").each do |tagname|
			if Tag.find_by(name: tagname).nil?
				Tag.create(name: tagname,post_id:@post[:id])
			end
		end

		redirect to "/post/#{@post[:id]}"
	else
		# @url = Url.create(params[:url])
		
	end
	# redirect to "/get/#{@url.short_url}"
end

get '/post/:id' do |id|
	@posts = Post.all
	@post = Post.find_by(id: id)
	@tags = @post.tags
	erb :post
end

get '/edit/:id' do |id|
	@post = Post.find_by(id: id)
	erb :post_edit
end

post '/edit/:id' do |id|
	if session[:user_id] != nil
		@post = Post.find_by(id: id)
		@post.title = params[:post][:title]
		@post.post = params[:post][:post]
		@post.save
	end

	redirect to "/dashboard/#{session[:user_id]}"
end

post "/delete/:id" do |id|
	if session[:user_id] != nil
		@post = Post.find_by(id: id)
		@post.destroy
	end

	redirect to "/dashboard/#{session[:user_id]}"
end

