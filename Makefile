tensorflow-build:
	docker build -f Dockerfile.tensorflow.cudnn -t marcino239/tensorflow:0.8.0 .

tensorflow-run:
	nvidia-docker run -it -p 8888:8888 marcino239/tensorflow:0.8.0

ros-build:
	docker build -t ros-jade -f Dockerfile.X.ros .

ros-run:
	docker run -it --rm -e DISPLAY=$$DISPLAY -v $$ROS_WS:/home/developer/ros_ws --device=/dev/dri/card0:/dev/dri/card0 -v /tmp/.X11-unix:/tmp/.X11-unix ros-jade

ros-indigo-build:
	docker build -t ros-indigo -f Dockerfile.X.ros.indigo .

ros-indigo-run:
	docker run -it --rm -e DISPLAY=$$DISPLAY -v $$ROS_WS:/home/developer/ros_ws --device=/dev/dri/card0:/dev/dri/card0 -v /tmp/.X11-unix:/tmp/.X11-unix ros-indigo
