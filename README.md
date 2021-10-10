# README
Spooky hunt is a Capture the Flag (CTF) game where players have to scan QR codes of "ghosts" using phone cameras which will capture the ghosts, these ghosts will be placed around a dark area and will have IR LEDs which most phone cameras can also pick up but that can't be seen with the naked eye (as far as im aware...) this will allow the player to 'scan for ghosts' so spooky!


# ToDo List

- [ ] Spooky Styles
- [ ] Leader board
    - [ ] Add Ghost capture
- [ ] Login Panel
    - [ ] Register hunter with email address and password
- [ ] Admin Panel
    - [ ] Put all ghost creation functionality behind this
- [ ] Test Scanning of QR codes on different phones
    


# Installation
Install ruby - we recommend using [rbenv](https://github.com/rbenv/rbenv)

Clone The Repo then run 
```
bundle install
gem install rails -v 6.1.4.1

```

Once `bundle install` has finished, run `rails -s` in your command line to run the webserver on localhost  (http://localhost:3000)
