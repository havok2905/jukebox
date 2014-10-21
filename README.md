# Jukebox

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

### Library

- `/library/collection` returns a JSON object with your entire music library
at a given path. This is a very intense server call that will take several seconds to finish.
- `/library/artists` returns an array of all artits
- `/library/artist_albums?artist=<artist_name>` returns an array of album names from the artist
- `/library/album_songs?artist=<artist_name>&album=<album_name>` returns a list of songs for a particular album
- `/library/artist_songs?artist=<artist_name>` returns an array of songs in the following format
- - `[ artist, album, song ]`
