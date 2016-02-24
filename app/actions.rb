# Homepage (Root path)
get '/' do
  erb :index
end

get '/signin' do
  erb :'user/signin'
end

get '/signin' do
  erb :'user/signin'
end

get '/project' do
  erb :'project/project'
end

get '/project/new' do
  erb :'project/new'
end
