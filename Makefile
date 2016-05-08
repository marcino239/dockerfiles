all:
	docker build -f Dockerfile.tensorflow.cudnn -t marcino239/tensorflow:0.8.0 .
