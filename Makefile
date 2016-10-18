tensorflow-build:
	docker build -f Dockerfile.tensorflow.cudnn -t marcino239/tensorflow:0.8.0 .

tensorflow-run:
	nvidia-docker run -it -p 8888:8888 marcino239/tensorflow:0.8.0

keras-build:
	docker build -f Dockerfile.keras.cudnn -t marcino239/keras:latest .

keras-run:
	docker run -it -v $$TF_WS:/notebooks -p 8888:8888 --device=/dev/nvidia0:/dev/nvidia0 --device=/dev/nvidiactl:/dev/nvidiactl -v /usr/lib/x86_64-linux-gnu/libcuda.so:/usr/lib/x86_64-linux-gnu/libcuda.so  -v /usr/lib/x86_64-linux-gnu/libcuda.so.1:/usr/lib/x86_64-linux-gnu/libcuda.so.1 -v /usr/lib/x86_64-linux-gnu/libcuda.so.352.93:/usr/lib/x86_64-linux-gnu/libcuda.so.352.93 marcino239/keras:latest
#	docker run -it -v $$TF_WS:/notebooks -p 8888:8888 --device=/dev/nvidia0:/dev/nvidia0 --device=/dev/nvidiactl:/dev/nvidiactl --device=/dev/nvidia-uvm:/dev/nvidia-uvm  -v /usr/lib/x86_64-linux-gnu/libcuda.so:/usr/lib/x86_64-linux-gnu/libcuda.so  -v /usr/lib/x86_64-linux-gnu/libcuda.so.1:/usr/lib/x86_64-linux-gnu/libcuda.so.1 -v /usr/lib/x86_64-linux-gnu/libcuda.so.352.93:/usr/lib/x86_64-linux-gnu/libcuda.so.352.93 marcino239/keras:latest
#	nvidia-docker run -it -v $$TF_WS:/notebooks -p 8888:8888 marcino239/keras:latest

pymc3-build:
	docker build -t pymc3:latest -f Dockerfile.pymc .

pymc3-run:
	docker run -it -p 8888:8888 pymc3:latest

gym-build:
	docker build -f Dockerfile.gym -t marcino239/gym:latest .

gym-run:
	docker run -it -v $$TF_WS:/notebooks -p 8888:8888 --device=/dev/nvidia0:/dev/nvidia0 --device=/dev/nvidiactl:/dev/nvidiactl --device=/dev/nvidia-uvm:/dev/nvidia-uvm  -v /usr/lib/x86_64-linux-gnu/libcuda.so:/usr/lib/x86_64-linux-gnu/libcuda.so  -v /usr/lib/x86_64-linux-gnu/libcuda.so.1:/usr/lib/x86_64-linux-gnu/libcuda.so.1 -v /usr/lib/x86_64-linux-gnu/libcuda.so.352.93:/usr/lib/x86_64-linux-gnu/libcuda.so.352.93 marcino239/gym:latest

ros-build:
	docker build -t ros-jade -f Dockerfile.X.ros .

ros-run:
	docker run -it --rm -e DISPLAY=$$DISPLAY -v $$ROS_WS:/home/developer/ros_ws --device=/dev/dri/card0:/dev/dri/card0 -v /tmp/.X11-unix:/tmp/.X11-unix ros-jade

#	wget https://bitbucket.org/osrf/gazebo_models/get/9ce1c9cfbc7c.zip
ros-indigo-build:
	docker build -t ros-indigo -f Dockerfile.X.ros.indigo .

ros-indigo-run:
	docker run -it --rm -e DISPLAY=$$DISPLAY -v $$ROS_WS:/home/developer/ros_ws --device=/dev/dri/card0:/dev/dri/card0 -v /tmp/.X11-unix:/tmp/.X11-unix ros-indigo bash
