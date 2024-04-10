
# README

Scavenger_hunt is a Capture the Flag (CTF) game where players have to scan QR codes of "Objects" using phone cameras which will capture these objects, the QR codes will be hidden and players will have to find and scan them! 


## Installation

- Install Ruby (we recommend using [rbenv][1])
- Install Docker (instructions to install docker can befound [here])
- Install libpq `sudo apt-get install libpq-dev` or `brew install libpq docker` on mac
- Install postgres via brew `brew install postgres`
- Clone The Repo 
- Copy and modify the '.env-example' file to '.env' 
- In the terminal run ``` Docker pull postgres ``` to get the latest postgres image
  - If you get an error in MacOS here - open the docker app first and try again
- Install npm `sudo apt-get install npm`
- Install yarn `sudo npm install --global yarn`
- In the terminal run ``` bin/setup ``` to set up the app
- If you get errors in spring `spring stop` and add the following env var`export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`


## Running rspec tests
`bundle exec rspec`

## Configuring S3 Storage
---

```bash
  echo "export AWS_ACCESS_KEY={accesskey}" >> ~/.bashrc
  echo "export AWS_SECRET_KEY={secretkey}" >> ~/.bashrc
  echo "export AWS_REGION={region}" >> ~/.bashrc
  echo "export AWS_BUCKET={bucket_name}" >> ~/.bashrc

  source ~/.bashrc
```

## Running server
Once `bundle install` has finished, copy and rename the env-example and amend the values to be your own
then run `bin/setup` this will create and configure the data

Enter `bin/rails s` in your command line to run the webserver on localhost  (http://localhost:3000)

---
### Contibutors

#### [ponix4k](https://github.com/ponix4k)
[![trophy](https://github-profile-trophy.vercel.app/?username=ponix4k&theme=onedark&row=2&column=3)](https://github.com/ryo-ma/github-profile-trophy)

#### [phyushin](https://github.com/phyushin)
[![trophy](https://github-profile-trophy.vercel.app/?username=phyushin&theme=onedark&row=2&column=3)](https://github.com/ryo-ma/github-profile-trophy)


[1]: https://github.com/rbenv/rbenv
[2]: https://docs.docker.com/get-docker/