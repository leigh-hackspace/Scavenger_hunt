# README

Scavanger_hunt is a Capture the Flag (CTF) game where players have to scan QR codes of "Objects" using phone cameras which will capture these objects, theQR codes  will be hidden and players will have to find and scan them! 

### ToDo List

- [ ] Refactor to make it more generic (remove references to ghosts, spooky etc.)
    

# Installation
Install Ruby (we recommend using [rbenv](https://github.com/rbenv/rbenv))

Clone The Repo then run 
```
./db_setup.sh
bundle install
gem install rails -v 6.1.4.1

```

## Setting up postgress database
---

Running the db_setup.sh file will create the database with the desired config

## Running rspec tests
`bundle exec rspec`


## Configuring S3 Storage
---

  echo "export AWS_ACCESS_KEY={accesskey}" >> ~/.bashrc
  echo "export AWS_SECRET_KEY={secretkey}" >> ~/.bashrc
  echo "export AWS_REGION={region}" >> ~/.bashrc
  echo "export AWS_BUCKET={bucket_name}" >> ~/.bashrc

source ~/.bashrc

```

Once `bundle install` has finished, run `rails -s` in your command line to run the webserver on localhost  (http://localhost:3000)