#!/usr/bin/ruby

class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers_list = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("title")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers_list.push(Volunteer.new({:name => title, :project_id => project_id, :id => id}))
    end
    volunteers_list
  end
end
