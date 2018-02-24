# Volunteer Tracker

#### _Simple app to tracks projects and assign volunteers_

#### By _**Misha Petrov**_

## Setup/Installation Requirements

You can view the app live by visiting

_https://enigmatic-sierra-89342.herokuapp.com/_

#### Or to deploy on local machine: ####

Clone to your local machine. In terminal, navigate to the root directory of the project
Recreate the database by using the following commands in terminal:

###### _$ createdb [volunteer_tracker]_

###### _$ psql [volunteer_tracker] < my_database.sql_

###### _$ createdb -T [volunteer_tracker] [volunteer_tracker_test]_

Use this command in terminal to run app on the localhost:

###### _$ ruby app.rb_

Test the code by typing (in terminal): 

###### _$ rspec_ 

## Specifications (use case scenarios)

* User can view, add, update and delete projects.
* User can add volunteers to the project
* User can view volunteers for the project
* User can edit and delete volunteers for the project

## Support and contact details

_modesau@gmail.com_

## Technologies Used

Ruby, Sinatra, Postgres, HTML, CSS

### License

*Licensed under MIT license*

Copyright (c) 2018 **_Misha Petrov_**
