# YAK 

This repository serves as the Flatiron School final project [Yicketty](https://github.com/cassymarie/yicketty).  Due to API Call limitations, this will be hosted on a local server. Follow the Installation instructions to connect.

## Installation

1. Clone the ***Yak*** repository in your terminal:  `git@github.com:*{your-username}*/yak.git`
2. move to the project directory: ` cd yak`
3. Run `bundle install`  
   . *see versions for installation requirements*
4. Run `rails s` to start the server
   . *the server needs to be **http://localhost:3000/** to function properly.*
5. Continue to [Yicketty](https://github.com/cassymarie/yicketty) and follow the Installation instructions to connect the projects.

## Versions

- Ruby version 3.0.0
- Rails 6.1.3

## Migrations

If migrations are required to start the project follow these steps to connect the project. In the terminal, from the project directory

1. Create the database connection: `rails db:create`
   . *this project utilizes postgres database*
2. Migration files are already setup, just run `rails db:migrate`
3. After tables are created without errors, get the starting information from seed data: `rails db:seed`

This should connect and give everything to start the project.  Run `rails s` to then connect to the server.
