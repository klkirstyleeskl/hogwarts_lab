require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do # index
  @students = Student.all()
  erb( :student_index )
end


get '/houses' do # index
  @houses = House.all()
  erb( :house_index )
end

# new
get '/students/new' do
  erb(:new)
end

# show
get '/students/:id' do
  @student = Student.find(params[:id].to_i)
  erb(:student_show)
end

get '/houses/:id' do
  @house = House.find(params[:id].to_i)
  erb(:house_show)
end

# create
post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb(:edit)
end

# update
post '/students/:id' do
  Student.new( params ).update
  redirect to '/students'
end


# destroy
post '/students/:id/delete' do
  student = Student.find(params['id'])
  student.delete
  redirect to '/students'
end
