require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects_list = Project.all()
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
