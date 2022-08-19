# README

Scavenger_hunt is a Capture the Flag (CTF) game where players have to scan QR codes of "Objects" using phone cameras which will capture these objects, theQR codes will be hidden and players will have to find and scan them! 


# Installation

- Install Ruby (we recommend using [rbenv](https://github.com/rbenv/rbenv))
- Install Docker (instructions to install docker can befound [here](https://docs.docker.com/get-docker/))
- Clone The Repo 
- Copy and modify the '.env-example' file to '.env' 
- In the terminal run ``` Docker pull postgres ``` to get the latest postgres image
- In the terminal run ``` bin/setup ``` to set up the app

## Running rspec tests
`bundle exec rspec`

## Configuring S3 Storage
---

```
  echo "export AWS_ACCESS_KEY={accesskey}" >> ~/.bashrc
  echo "export AWS_SECRET_KEY={secretkey}" >> ~/.bashrc
  echo "export AWS_REGION={region}" >> ~/.bashrc
  echo "export AWS_BUCKET={bucket_name}" >> ~/.bashrc

  source ~/.bashrc
```

## Starting the app
Once `bundle install` has finished, run `rails s -b 0.0.0.0` in your command line to run the webserver on localhost  (http://localhost:3000)

### ToDo List

- [ ] Create small mobile CSS
- [ ] Create "theme generator"

### Issues
If you have any issues when running the app please submit an issue ticket
