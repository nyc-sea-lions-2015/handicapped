get '/course/:id/add' do
  course = Course.find_by(id: params[:id])
  erb :'score/_add', locals:{course: course}
end

post '/course/:id/add' do
  # Here's how I would do this:
  # More concise!
  course = Course.find(params[:id])
  new_score = course.scores.create(strokes: params[:strokes], user: current_user)

  if request.xhr?
    erb :'score/_eachscore', locals:{score: new_score}, layout: false
  else
    [500, "Made an error!"]
  end
end

delete '/score/:id' do
  Score.find(params[:id]).destroy
  redirect '/'
end
