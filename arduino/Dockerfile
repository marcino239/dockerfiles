FROM ubuntu:16.04
MAINTAINER marcino239@gmail.com

RUN apt-get update \
	&& apt-get install -y \
		wget \
		openjdk-8-jre \
		xz-utils \
		unzip \
		bzip2 \
		lbzip2 \
		xvfb \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ARDUINO_IDE_VERSION 1.6.13
RUN wget -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz | tar xJC /usr/local/share \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino \
	&& wget https://github.com/rogerclarkmelbourne/Arduino_STM32/archive/master.zip -O /tmp/Arduino_STM32.zip \
	&& unzip /tmp/Arduino_STM32.zip -d /usr/local/share/arduino/hardware \
	&& rm /tmp/Arduino_STM32.zip \
	&& mv /usr/local/share/arduino/hardware/Arduino_STM32-master /usr/local/share/arduino/hardware/Arduino_STM32

RUN xvfb-run -a /usr/local/share/arduino/arduino --install-boards arduino:samd:1.6.12

CMD ["/usr/local/bin/arduino"]

