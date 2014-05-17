#! /bin/bash

set -u

if [ $# -lt 1 ]; then
	echo "Usage: $0 thegithostdomain"
	exit 1
fi

githost=$1

filename=$(ssh $githost "ls -t /home/git/gitlab/tmp/backups/*|head -1")

echo $filename

test -f /home/git/gitlab_backup/ || mkdir -p /home/git/gitlab_backup/

rsync --progress $githost:$filename /home/git/gitlab_backup/

sudo -u git -H rm -f /home/git/gitlab/tmp/backups/*

sudo -u git -H cp /home/git/gitlab_backup/${filename##*/} /home/git/gitlab/tmp/backups/