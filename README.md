# Git-A-Club
A Marketplace application for golfers to connect with one another. Golfers can list their clubs or sets up for rent or rent clubs from other golfers within the community.

### Installation Instructions
* Fork the repo and clone to your computer
* Run bundler `bundle install` 
* Create an application.yml file inside the /config folder (/config/application.yml)
  * Add the following to the application.yml file with the Stripe test api keys on the Stripe website
    * `PUBLISHABLE_KEY:` 
    * `SECRET_KEY: `
* Start your Postgres server
  * In your terminal run the following command
    * `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`
* Database creation, in your terminal
  * `rake db:create`
  * `rake db:migrate`
* Start up the Rails application, in your terminal run the following command
  * `rails s`

### Technologies used in this project
* Ruby on Rails
* jQuery
* jQuery UI
* Handlebars.js
* Chart.js
* D3.js

### Running the test suite
* `bin/rake db:migrate RAILS_ENV=test`
* `rspec`

### Future Features
* Convert Rails backend to purely an API with the use of the following
 * gem 'active_model_serializers'
 * gem 'rack-cors', :require => 'rack/cors'
* Connect back end Rails API with a front end Ember application
* 
