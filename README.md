# README

CMS API

* Ruby version - 2.5.1
* Rails version - 5.2

Steps to setup the application

1. Set gemset name inside .ruby-gemset file in application root, then run `bundle install` inside application root directory
2. Copy database.yml.example content to database.yml and add username and password of Postgres instance
3. Install postgres DB and redis-server which is required for sidekiq background processing
4. Run rails db:create
5. Run rails db:migrate
6. Run rails db:seed to populate seed data
7. Start rails server by executing `rails s` command inside project root directory

How to run the test suite?

Run `rspec spec` inside application root

Steps to access UI

1. Open cms_ui directory and open index.html file in browser.

Thanks

