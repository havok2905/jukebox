# Jukebox

## Stack

- Ubuntu
- Ruby 2.1.3
- Grape, ruby micro framework for rest apis
- Rack
- AngularJS

## Vagrant Setup

- `vagrant up`
- `vagrant ssh`
- `cd /srv/jukebox/ruby`
- `rackup`

## Manual Setup

**This box will eventually be packaged. This set up process will simplify fairly soon**

- `vagrant up`
- `vagrant ssh`
- `sudo apt-get update`
- `sudo apt-get install curl`
- `\curl -L https://get.rvm.io | bash -s stable --ruby`
- `source ~/.profile`
- `sudo apt-get install vim`
- `vim  ~/.profile` and add ` [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"`
- `source ~/.rvm/scripts/rvm`
- `rvm use 2.1.3` Use the latest ruby version
- `cd /srv/jukebox/`
- `bundle install`
- `cd ruby`
- `rackup`

## API

All API calls are prefixed with an api route.
All API responses are in JSON format

Example route.

`33.33.33.25:9292/api/XXXXXXXX/XXXXXXXX`

### Library

- `/library/collection` returns a JSON object with your entire music library
at a given path.
