get '/course/:id/add' do
  course = Course.find_by(id: params[:id])
  erb :'score/add', locals:{course: course}
end

post '/course/:id/add' do
  user = current_user
  course = Course.find_by(id: params[:id])
  new_score = Score.new(  strokes: params[:strokes],
                          course: course,
                          user: user)
  if new_score.save!
    redirect "/user/#{user.id}/course/#{course.id}"
  else
    [500, "Made an error!"]
  end
end

get '/score/:id/delete' do
  curr_score = Score.find_by(id: params[:id])
  erb :'score/delete', locals:{score: curr_score}
end
