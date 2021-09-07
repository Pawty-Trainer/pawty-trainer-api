# Pawty Trainer [![Build Status](https://app.travis-ci.com/Pawty-Trainer/pawty-trainer-api.svg?branch=main)](https://app.travis-ci.com/Pawty-Trainer/pawty-trainer-api)

This is the "backend" repository for the Pawty Trainer application. It is responsible for sending api responses to our [frontend application](https://github.com/Pawty-Trainer/pawty-trainer).

### About this Project

Pawty Trainer is an application in which users can organize and schedule training with their puppy. Users can create multiple dogs, see specific breed information, and create scheduled trainings for their dogs.

### Database Schema
![DB Schema](https://user-images.githubusercontent.com/77904287/131035076-d2ae8a04-aeeb-43cf-8a8f-60239182141e.png)

### Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

## Versions

- Ruby 2.7.2

- Rails 5.2.6

## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)
* [pry](https://github.com/pry/pry)
* [factory-bot-rails](https://github.com/thoughtbot/factory_bot_rails)
* [faker](https://github.com/faker-ruby/faker)
* [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
* [byebug](https://github.com/deivid-rodriguez/byebug)
* [json](https://github.com/flori/json)
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
* [travis](https://github.com/travis-ci/travis.rb)

API Consumption
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)
## Running the tests

Run `bundle exec rspec` to run the test suite

## Deployment

See our app in action [here](https://pawty-trainer-api.herokuapp.com/)

## Authors
### Backend
|Developer     |GitHub Handle                               |LinkedIn                                                     |
|:---          |:---                                        |:---                                                         |
|Emmy Morris   |[emmymorris](https://github.com/EmmyMorris) |[Emmy's LinkedIn](https://www.linkedin.com/in/emmymorris/)   |
|Kon Ham       |[kon-ham](https://github.com/kon-ham)       |[Kon's LinkedIn](https://www.linkedin.com/in/kon-ham/)       |
|Mark Yen      |[markcyen](https://github.com/markcyen)     |[Mark's LinkedIn](https://www.linkedin.com/in/markcyen/)     |

### Frontend
|Developer     |GitHub Handle                               |LinkedIn                                                     |
|:---          |:---                                        |:---                                                         |
|Alex Kio      |[alexmkio](https://github.com/alexmkio)     |[Alex's LinkedIn](https://www.linkedin.com/in/alexkio/)      |
|Sydney Bear   |[sydnerd](https://github.com/sydnerd)       |[Sydney's LinkedIn](https://www.linkedin.com/in/sydneybear/) |
