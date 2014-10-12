# Jukebox

## Setup

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
