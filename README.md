# README

CMS API

* Ruby version - 2.5.1
* Rails version - 5.2

Steps to setup the application

1. Set gemset name inside .ruby-gemset file in application root, then run `bundle install` inside application root directory
2. Copy database.yml.example content to database.yml and add username and password of Postgres instance
3. Run rails db:create
4. Run rails db:migrate
5. Run rails db:seed to populate seed data
6. Start rails server by executing `rails s` command inside project root directory

How to run the test suite?

Run `rspec spec` inside application root

