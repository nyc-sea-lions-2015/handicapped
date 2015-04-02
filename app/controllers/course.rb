get '/course/find' do
  erb :'course/find'
end

post '/course/find' do
  # Remove temporary variables wherever possible
  course = Course.find_by(name: params[:query])
  # Its more conventional to check for a trueness and then fall through to false
  if course
    redirect "/course/#{course.id}"
  else
    redirect '/course/new'
  end
end

get '/course/new' do
  erb :'course/new'
end

post '/course/new' do
  course = Course.new(  name: params[:name],
                        course: params[:course],
                        slope: params[:slope])

  # Use .save, not .save! with conditionals. The save! will throw an exception
  if course.save
    redirect "/course/#{course.id}"
  else
    [500, "something went wrong in the creation!"]
  end
end

get '/course/:id' do
  course = Course.find_by(id: params[:id])
  erb :'course/details', locals:{course: course}
end


