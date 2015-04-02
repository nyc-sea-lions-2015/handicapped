get '/user/:id' do
  user = User.find_by(id: params[:id])
  # Now that we have the has_many, through relationship, we can just do:
  courses = user.courses
  # course_id = user.scores.pluck(:course_id).uniq
  # course = []
  # course_id.each do |id|
  #   course << Course.find(id)
  # end
  erb :'user/details', locals: {user: user, course: courses}
end

get '/user/:id/edit' do
  user = User.find_by(id: params[:id])
  erb :'user/edit', locals:{user: user}
end

put '/user/:id/edit' do
  curr_user = User.find_by(id: params[:id])
  if curr_user
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

get '/user/:id/course/:course' do
  user = User.find_by(id: params[:id])
  course = Course.find_by(id: params[:course])
  scores = user.scores.where(course_id: course.id)
  handicap = ( scores.nil? ? "NA" : course.calculate(scores.pluck(:strokes)))
  erb :'user/stats', locals:{user: user, course: course, scores: scores, handicap: handicap}
end
