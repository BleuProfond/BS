# Homepage (Root path)
get '/' do
  erb :index
end

get '/signin' do
  erb :'user/signin'
end

get '/account' do
  erb :'user/account'
end

get '/signout' do
	session[:user_id] = nil
	redirect '/'
end

get '/signup' do
	@user = User.new
	erb :'user/signup'
end

post '/signup' do
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]

  if @user.save
    session[:user_id] = @user.id
    redirect '/account'
  else
    erb :'user/signup'
  end
end

post '/signin' do
	email = params[:email]
	password = params[:password]
	@user = User.find_by(email: email, password: password)
	if @user
		session[:user_id] = @user.id
		redirect '/account'
	end
end

get '/projects' do
  @projects= Project.all 
  erb :'project/project'
end

get '/projects/new' do
  erb :'project/new'
end

