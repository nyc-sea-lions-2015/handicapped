get '/course/:id/add' do
  course = Course.find_by(id: params[:id])
  erb :'score/_add', locals:{course: course}
end

post '/course/:id/add' do
  user = current_user
  course = Course.find_by(id: params[:id])
  new_score = Score.new(  strokes: params[:strokes],
                          course: course,
                          user: user)
  new_score.save!

  if request.xhr?
    erb :'score/_eachscore', locals:{score: new_score}, layout: false
  else
    [500, "Made an error!"]
  end
end

delete '/score/:id' do
  score = Score.find_by(id: params[:id])
  Score.find_by(id: params[:id]).destroy
  redirect '/'
end
