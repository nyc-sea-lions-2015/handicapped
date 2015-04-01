get '/' do
  if current_user != nil
    redirect "/user/#{current_user.id}"
  end
  erb :index
end
