#!/bin/bash

rsync -Pav --delete-after ~/nextcloud/ /media/victor/ebackup/nextcloud
rsync -Pav --delete-after --exclude="node_modules" ~/npq/ /media/victor/ebackup/npq
rsync -Pav --delete-after /media/victor/ddd/pics/ /media/victor/ebackup/pics

