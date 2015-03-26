enable :sessions

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  @tags = Tag.all
  erb :index
end


