get '/' do
  redirect "/user/#{current_user.id}" if current_user != nil
  erb :index
end
