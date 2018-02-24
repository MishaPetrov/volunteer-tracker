require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

@project = Project.new(:title => "ruby", :id => nil)
@project.save()
volunteer = Volunteer.new(:name => "Misha Petrov", :project_id => @project.id(), :id => nil)
volunteer.save()
volunteer2 = Volunteer.new(:name => "Andrew Peterson", :project_id => @project.id(), :id => nil)
volunteer2.save()

get('/') do
  @projects_list = Project.all()
  @volunteers_list = Volunteer.all()
  erb(:index)
end

post('/') do
  title = params.fetch("title")
  project = Project.new(:title => title, :id => nil)
  project.save
  @projects_list = Project.all()
  erb(:index)
end

get('/projects/:id') do
  id = params.fetch("id").to_i()
  @project = Project.find(id)
  @volunteers_list = @project.volunteers()
  erb(:project)
end

post('/projects/:id') do
  project_id = params.fetch("id").to_i()
  name = params.fetch("name")
  volunteer = Volunteer.new(:name => name, :project_id => project_id, :id => nil)
  volunteer.save()
  @project = Project.find(project_id)
  @volunteers_list = @project.volunteers()
  erb(:project)
end

get('/projects/:id/edit') do
  id = params.fetch("id").to_i()
  @project = Project.find(id)
  erb(:detail)
end

patch("/projects/:id/edit") do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:title => title})
  erb(:detail)
end

delete("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects_list = Volunteer.all()
  erb(:index)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

patch("/volunteers/:id/edit") do
  name = params.fetch("name")
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:name => name})
  erb(:volunteer)
end

delete("/volunteers/:id/edit") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.delete()
  @projects_list = Project.all()
  erb(:index)
end
