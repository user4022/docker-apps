#!/bin/bash

appname=firefox-python-selenium
username=$(whoami)


if ! groups $username | grep -q 'docker'; then
	echo ---------------------------------
	echo ERROR:
	echo User:$username not in group docker
	echo ---------------------------------
	echo Please run:
	echo groupadd docker";" gpasswd -a $USER docker";" newgrp docker
	echo ---------------------------------
	exit
fi

checkimage=$(docker images | grep archlinux/archlinux)
if [ -z "$checkimage" ]; then
	echo ---------------------------------
	echo ERROR:
	echo Image archlinux/archlinux not found	
	echo -------------------------------
	exit
fi

mkdir -p $HOME/.dockerapps/$appname/profiles.d
docker build -t firefox-python-selenium .

