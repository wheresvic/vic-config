#!/bin/bash

rsync -Pav --delete-after /media/victor/ddd/videos/movies/2-vic/ pi@192.168.42.178:/media/pi/bbb/bbb/video/movies
rsync -Pav --delete-after /media/victor/ddd/moosik/ pi@192.168.42.178:/media/pi/bbb/bbb/music

