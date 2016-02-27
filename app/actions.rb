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
  @user = User.new
  @incorrect = false
  erb :'user/signin'
end

get '/account' do
  @user = User.find(session[:user_id]) if session[:user_id]
  erb :'user/account'
end
# make sure to define the instance variable in get and post.

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
  else 
    # session[:user_id] = nil
    @incorrect = true
    erb :'user/signin'
	end
end

get '/project/:id' do
  @project = Project.find(params[:id])
  erb :'project/project'
end

get '/projects/new' do
  @user = current_user
  @project = Project.new 
  erb :'project/new'
end

post '/projects' do
  @project = Project.new(
    project_name: params[:project_name],
    project_idea: params[:project_idea],
    project_problem: params[:project_problem],
    user_id: @user.id
    )
  @project.save
  if @project.save
    redirect '/account'
  else
    erb :'project/new'
  end
end

get '/projects/index' do 
  @projects = Project.all
  erb :'project/index'
end 

post '/project/:id/comment/new' do 
  @project = Project.find(params[:id])
  @comment = Comment.new(
    comments: params[:comment],
    user_id: session[:user_id],
    project_id: params[:id]
   )
  @comment.save 
  redirect ('/project/' + params[:id].to_s)
end

# get '/results' do
#   erb :'project/results'
# end

get '/search' do
  @projects = Project.all
  @query = params[:query]
  @result = []
  @projects.each do |project|
    if project.tags.split(", ").any? { |tag| tag == @query }
      @result << project
    end
  end
  erb :'project/search'
end 

post '/project/:id/comment/:comment_id' do 
  Comment.find(params[:comment_id]).destroy
  redirect ('/project/' + params[:id].to_s)
end

