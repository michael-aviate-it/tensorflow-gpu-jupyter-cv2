FROM tensorflow/tensorflow:latest-gpu-jupyter

WORKDIR /home/user

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libsm6 \
    iputils-ping \
    nano \
    net-tools \
    sudo \
    wget \
	protobuf-compiler \
	python3-venv
	

# Coral TPU
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    gir1.2-gtk-3.0 \
    gstreamer-1.0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-x \
    libedgetpu1-std \
    python3-pycoral


RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
