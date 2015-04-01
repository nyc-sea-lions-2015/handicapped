get '/course/:id/add' do
  user = current_user
  course = Course.find_by(id: params[:id])
  erb :'score/add', locals:{user: user, course: course}
end
