
# Pawty Trainer [![Build Status](https://app.travis-ci.com/Pawty-Trainer/pawty-trainer-api.svg?branch=main)](https://app.travis-ci.com/Pawty-Trainer/pawty-trainer-api)

This is the "backend" repository for the Pawty Trainer application. It is responsible for sending api responses to our [frontend application](https://github.com/Pawty-Trainer/pawty-trainer).


## About this Project

Pawty Trainer is an application in which users can schedule training for their puppy. Users can add dogs to their pack, and create trainings for each dog. A user receives a reward ("★") for completing their first training, and then for every third training after that.

## Table of Contents

- [Database Schema](#database-schema)
- [How to use the app](#how-to-use-the-app)
- [About the app](#about-the-app)
- [Learning Goals](#learning-goals)
- [Contributors](#contributors)
- [Future Additions](#future-additions--reflections)

### Database Schema
![DB Schema](https://user-images.githubusercontent.com/77904287/131035076-d2ae8a04-aeeb-43cf-8a8f-60239182141e.png)



## How to use the app
### Deployment

#### [View Our App Here!](https://pawty-trainer.github.io/pawty-trainer/)

### Local Installation

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`


### Running the tests

- Run `bundle exec rspec` to run the test suite

- To see a coverage report enter `$ open coverage/index.html`
- SimpleCov test coverage is at 100.00%:

<img alt="Pawty Trainer Test Coverage" src="https://user-images.githubusercontent.com/77904287/132581055-86a4bf90-3598-4b4e-98cf-217c1e66faa5.png">

## About the app

### Tech Stack

<section display="inline-block">
 <a><img alt="Ruby" src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/></a>
 <a><img alt="GraphQL" src="https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white" /></a>
 <a><img alt="Ruby on Rails" src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /></a>
 <a><img alt="JSON" src="https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white" /></a>
 <a><img alt="PostgreSQL" src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" /></a>
 <a><img alt="Git" src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" /></a>
 <a><img alt="Heroku" src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white" /></a>
 <a><img alt="Travis CI" src=https://img.shields.io/badge/travis_CI-3EAAAF?style=for-the-badge&logo=travisci&logoColor=white" /></a>
</section>

### Versions

- Ruby 2.7.2
- Rails 5.2.6

### Important Gems

* [rspec-rails](https://github.com/rspec/rspec-rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [pry](https://github.com/pry/pry)
* [factory-bot-rails](https://github.com/thoughtbot/factory_bot_rails)
* [faker](https://github.com/faker-ruby/faker)
* [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
* [byebug](https://github.com/deivid-rodriguez/byebug)
* [json](https://github.com/flori/json)
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
* [travis](https://github.com/travis-ci/travis.rb)


## Learning Goals

- Work with a frontend team to build out a fullstack application
- Use continuous integration tools to build and automate the testing and deployment of the application
- Utilize a Git Rebase workflow
- Use an agile process to turn well defined requirements into deployed and production ready software
- Utilize GraphQL

## Contributors
### Frontend
<table>
  <tr>
    <td align="center" > Sydney Bear</td>
    <td align="center"> Alex Kio</td>
  </tr>
  <tr>
    <td align="center" > <a href="https://github.com/sydnerd">GitHub</td>
    <td align="center"> <a href="https://github.com/alexmkio">GitHub</td>
  </tr>
    <tr>
    <td align="center" > <a href="https://www.linkedin.com/in/sydneybear/">LinkedIn</td>
    <td align="center"> <a href="https://www.linkedin.com/in/alexkio/">LinkedIn</td>
  </tr>
    <td><img src="https://avatars.githubusercontent.com/u/78241098?v=4" alt='Portrait photo of Sydney' width="150" height="auto" /></td>
    <td><img src="https://avatars.githubusercontent.com/u/12686237?v=4" alt="Portrait photo of Alex" width="150" height="auto" /></td>
</table>

### Backend
<table>
   <tr>
    <td align="center" > Emmy Morris</td>
    <td align="center"> Kon Ham </td>
    <td align="center"> Mark Yen </td>
  </tr>
  <tr>
    <td align="center" > <a href="https://github.com/EmmyMorris">GitHub</td>
    <td align="center"> <a href="https://github.com/kon-ham">GitHub </td>
    <td align="center"> <a href="https://github.com/markcyen">GitHub</td>
  </tr>
    <tr>
    <td align="center" > <a href="https://www.linkedin.com/in/emmymorris/">LinkedIn</td>
    <td align="center"> <a href="https://www.linkedin.com/in/kon-ham/">LinkedIn</td>
    <td align="center"> <a href="https://www.linkedin.com/in/markcyen/">LinkedIn</td>
  </tr>
    <td><img src="https://avatars.githubusercontent.com/u/77904287?v=4" alt='Portrait photo of Emmy' width="150" height="auto" /></td>
    <td><img src="https://avatars.githubusercontent.com/u/72781879?v=4" alt="Portrait photo of Kon" width="150" height="auto" /></td>
    <td><img src="https://avatars.githubusercontent.com/u/77414433?v=4" alt="Portrait photo of Mark" width="150" height="auto" /></td>
</table>


## Future Additions & Reflections

There are so many ways to improve this site. Some major priorities include:

1. Add user authentication (signup, login)
2. Add an alert for the user to see when they've received a new reward
3. More robust loading and error pages
