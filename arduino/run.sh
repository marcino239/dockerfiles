#!/bin/bash

docker rm arduino

docker run -ti \
	-v /etc/localtime:/etc/localtime:ro \
	-v $HOME/.Xauthority:/root/.Xauthority \
	-e DISPLAY=unix$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--device /dev/snd \
	--device /dev/dri \
	--name arduino \
	marcino239/arduino
	$@
