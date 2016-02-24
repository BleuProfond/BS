# Homepage (Root path)
get '/' do
  erb :index
end

get '/signin' do
  erb :'user/signin'
end