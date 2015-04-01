get '/user/:id' do
  user = User.find_by(id: params[:id])
  course_id = user.scores.pluck(:course_id)
  course = []
  course_id.each do |id|
    course << Course.find(id)
  end
  erb :'user/details', locals: {user: user, course: course}
end

get '/user/:id/edit' do
  user = User.find_by(id: params[:id])
  erb :'user/edit', locals:{user: user}
end

puts '/user/:id/edit' do
  curr_user = User.find_by(id: params[:id])
  if curr_user
    curr_user.username = params[:username]
    curr_user.password = params[:password]
    if curr_user.save!
      redirect "/user/#{user.id}"
    else
      [500, "You made an error somewhere!"]
    end
  else
    [500, "Not the right user!"]
  end
end
