#!/bin/bash

rsync -Pav --delete-after ~/nextcloud/ /media/victor/sbackup/nextcloud
rsync -Pav --delete-after ~/db-backups/ /media/victor/sbackup/db-backups
rsync -Pav --delete-after --exclude="node_modules" ~/npq/ /media/victor/sbackup/npq
rsync -Pav --delete-after /media/victor/ddd/pics/ /media/victor/sbackup/pics
rsync -Pav --delete-after /media/victor/ddd/edu/ /media/victor/sbackup/edu
rsync -Pav --delete-after /media/victor/ddd/moosik/ /media/victor/sbackup/moosik

