all:
	docker build -f Dockerfile.tensorflow.cudnn -t marcino239/tensorflow:0.8.0 .

run: all
	nvidia-docker run -it -p8888:8888 git config --global user.name
