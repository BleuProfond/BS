# Homepage (Root path)
get '/' do
  erb :index
end

get '/signin' do
  erb :'user/signin'
end

get '/signout' do
	session[:user_id] = nil
	redirect '/signin'
end

get '/signup' do
	@user = User.new
	erb :signup
end

post '/signup' do
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :signup
  end
end

post '/signin' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	user = User.find_by(name: name)
	user = User.find_by(email: email)
	if user.password == password
		session[:user_id] = user.id
		redirect '/'
	end
end

get '/project' do
  erb :'project/project'
end

get '/project/new' do
  erb :'project/new'
end
