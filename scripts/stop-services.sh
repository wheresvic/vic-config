#!/bin/bash

sudo service teamviewerd stop
#sudo service teamviewerd status

sudo service icecast2 stop
sudo service icecast2 status
sudo service mpd stop
sudo service mpd status

sudo service mongodb stop
sudo service mongodb status

sudo service postgresql stop
sudo service postgresql status

sudo service mysql stop
sudo service mysql status

sudo service apache2 stop
sudo service apache2 status

