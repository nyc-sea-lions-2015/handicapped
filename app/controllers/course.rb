get '/user/:id/course/:course' do
  user = User.find_by(id: params[:id])
  course = Course.find_by(id: params[:course])
  scores = user.scores.where(course_id: course.id)
  erb :'course/details', locals:{user: user, course: course, scores: scores}
end

get '/course/new' do
  erb :'course/new'
end

post '/course/new' do
  course = Course.new(  name: params[:name],
                        course: params[:course],
                        slope: params[:slope])
  if course.save!
    redirect '/course/details'
  else
    [500, "something went wrong in the creation!"]
  end
end
