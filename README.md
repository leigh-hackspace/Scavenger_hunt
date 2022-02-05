# README
Scavanger_hunt is a Capture the Flag (CTF) game where players have to scan QR codes of "Objects" using phone cameras which will capture these objects, theQR codes  will be hidden and players will have to find and scan them! 

# ToDo List

- [ ] Refactor to make it more generic (remove references to ghosts, spooky etc.)
    


# Installation
Install Ruby (we recommend using [rbenv](https://github.com/rbenv/rbenv))

Clone The Repo then run 
```
./db_setup.sh
bundle install
gem install rails -v 6.1.4.1

```


setting up postgress database

---
Running the db_setup.sh will set up the postgress database and ask you for your desired config 

```

Once `bundle install` has finished, run `rails -s` in your command line to run the webserver on localhost  (http://localhost:3000)
