all:
	docker build -f Dockerfile.tensorflow.cudnn -t marcino239/tensorflow:0.8.0 .

run: all
	nvidia-docker run -it -p8888:8888 marcino239/tensorflow:0.8.0

build-ros:
	docker build -t ros-jade -f Dockerfile.X.ros .

run-ros:
	docker run -ti --rm -e DISPLAY=$$DISPLAY --device=/dev/dri/card0:/dev/dri/card0 -v /tmp/.X11-unix:/tmp/.X11-unix ros-jade bash
