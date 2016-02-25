# Homepage (Root path)
helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/signin' do
  erb :'user/signin'
end

get '/account' do
  @user = current_user
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

get '/project/:id' do
  @project = Project.find(params[:id])
  erb :'project/project'
end

post '/project/new' do
  @project = Project.new(
    project_name: params[:project_name],
    project_idea: params[:project_idea],
    project_problem: params[:project_problem]
    )
  @project.save
  redirect 'user/account'
end

get '/projects' do
  @projects= Project.all 
  erb :'project/project'
end

get '/projects/new' do
  erb :'project/new'
end

get '/projects/index' do 
  erb :'project/index'
end 

