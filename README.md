# Jukebox

## Contributions

To make a contribution to jukebox, do the following:

- Create a new issue
- Fork or create a new branch of Jukebox named after that issue
- Write any additional code or modifications to existing code
- Write RSpec tests for those additions/modifications
- Ensure the entire test suite passes
- If any tests fail due to something unrelated to your work, create a new issue and make note of this in the pull request comment
- Open a new pull request and describe what you did

## Stack

- Ubuntu
- Ruby 2.1.3
- Grape, ruby micro framework for rest apis
- Rack
- RSpec

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

`33.33.33.25:9292/api/v1/XXXXXXXX/XXXXXXXX`

For information on routes:
- `cd /srv/jukebox/ruby`
- `rake api:routes`
