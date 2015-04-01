get '/auth/login' do
  erb :'auth/login'
end

put '/auth/login' do
  user = User.find_by(username: params[:username])

  if user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    session[:message] = "Incorrect username and/or password!"
    redirect '/auth/login'
  end
end

get '/auth/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/auth/signup' do
  erb :'auth/signup'
end

post '/auth/signup' do
  user = User.new(  username: params[:username],
                    password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    [500, "Uh oh! You dun goofed!"]
  end
end
