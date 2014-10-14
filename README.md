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
- `cd /srv/jukebox`
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
