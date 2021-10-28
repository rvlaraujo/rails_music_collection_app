# Rails Collection Music App

This is a simple Ruby on Rails full stack application to manage music albums, a requirement for the Moat Builders tech test.

More details about of the test requirements can be finding [here](https://gitlab.com/-/snippets/2167416)

- [Rails Collection Music App](#rails-collection-music-app)
    - [NOTE](#note)
  - [GETTING START](#getting-start)
  - [System dependencies](#system-dependencies)
  - [Running the project](#running-the-project)
    - [Cloning the project](#cloning-the-project)
      - [From GitHub](#from-github)
      - [From GitLab](#from-gitlab)
    - [Running App with Docker and Docker-compose](#running-app-with-docker-and-docker-compose)
    - [Running App WITHOUT Docker and Docker-compose](#running-app-without-docker-and-docker-compose)
      - [Configure the PostgreSQL](#configure-the-postgresql)
      - [Installing Ruby and Rails](#installing-ruby-and-rails)
      - [Install Gems](#install-gems)
      - [Adding Twitter Bootstrap 5](#adding-twitter-bootstrap-5)
    - [Configure databaese](#configure-databaese)
      - [Runs the application](#runs-the-application)
    - [Accessing the application](#accessing-the-application)
  - [Running tests](#running-tests)
    - [With Docker and Docker-compose](#with-docker-and-docker-compose)
    - [WITHOUT Docker and Docker-compose](#without-docker-and-docker-compose)
  - [CONTACT](#contact)

### NOTE

Just keep in mind this application are not completeness of features or design.

## GETTING START

## System dependencies

* Ruby 3.0.2;
* Rails 6.1.4;
* Git 2.31;
* PostgreSQL 13.4.

If you prefer to use Docker:

* Ruby 3.0.2;
* Git 2.31+;
* Docker 20.10+;
* Docker-compose 1.29.2.

## Running the project

These instructions will provide a copy of the project up and running on your local machine for development and testing purposes.

### Cloning the project

To get started with the app, first clone the repo and cd into the directory:

#### From GitHub

```bash
## GitHub Repository
git clone git@github.com:rvlaraujo/rails_music_collection_app.git
cd rails_music_collection_app
```

#### From GitLab

```bash
## GitLab Repository
git clone git@gitlab.com:rvlaraujo/rails_music_collection_app.git
cd rails_music_collection_app
```

### Running App with Docker and Docker-compose

In the root of the project, install gems via bundler:

```bash
bundle install
```

Build the images with Docker-compose:

```bash
docker-compose build
```

Create the database, runs the migrations and seeds:

```bash
docker-compose run web rails db:setup
```

Runing the containers:

```bash
docker-compose up
```

### Running App WITHOUT Docker and Docker-compose

#### Configure the PostgreSQL

Following the instructions in the links under to configure the PostgreSQL in your environment:

* [Ubuntu Linux](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
* [MacOS](https://www.robinwieruch.de/postgres-sql-macos-setup)
* [Windows](https://www.guru99.com/download-install-postgresql.html)

#### Installing Ruby and Rails

Following the instructions in the links under to configure the Ruby and Rails in your environment:

* [Install Ruby On Rails on Ubuntu 21.04 Hirsute Hippo (e outras versões), com rbenv ou rvm](https://gorails.com/setup/ubuntu/21.04)
* [Install Ruby On Rails on macOS 11.0 Big Sur](https://gorails.com/setup/osx/11.0-big-sur)
* [Install Ruby On Rails on Windows 10](https://gorails.com/setup/windows/10)


#### Install Gems

In the root of project, run the following command:

```bash
bundle install
```

#### Adding Twitter Bootstrap 5

In the root of project, run the following command:

```bash
yarn add bootstrap jquery @popperjs/core bootstrap-icons
```

### Configure databaese

For create the database, runs the migrations and seeds, runs the following command:
```bash
rails db:setup
```

#### Runs the application

Runs:

```bash
rails server
```

### Accessing the application

Open the browser and access [http://0.0.0.0:3000](http://0.0.0.0:3000)

If you runs seeds.rb file, the application has 2 users:

* Administrator
  * login: administrator
  * password: administrator
  * role: admin
* Common User
  * login: commonuser
  * password: commonuser
  * role: user

But you are free for registration new users. After registration of a new user, you're automatically login in the application.


The main page of the application list all allowed users, provided by endpoints in the [test decription](https://gitlab.com/-/snippets/2167416)

## Running tests

### With Docker and Docker-compose

To run all tests, just execut the following command in the root of the project:

```bash
docker-compose run web rspec --format documentation
```

For more informations about runs RSpec tests, see [RSpec Running Specs](https://github.com/rspec/rspec-rails#running-specs).


### WITHOUT Docker and Docker-compose

To run all tests, just execut the following command in the root of the project:

```bash
rspec --format documentation
```

For more informations about runs RSpec tests, see [RSpec Running Specs](https://github.com/rspec/rspec-rails#running-specs).

## CONTACT

Comments and feedback are welcome.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](www.linkedin.com/in/rafael-viana-75529b32)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rvlaraujo)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:rvlaraujo@gmail.com)
