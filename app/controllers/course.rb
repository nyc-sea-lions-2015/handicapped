get '/user/:id/course/:course' do
  user = User.find_by(id: params[:id])
  course = Course.find_by(id: params[:course])
  scores = user.scores.where(course_id: course.id)
  erb :'score/scores', locals:{user: user, course: course, scores: scores}
end
