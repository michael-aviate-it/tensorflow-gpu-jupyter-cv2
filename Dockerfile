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
	
RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
