#FROM debian:testing
#FROM ubuntu:bionic-20200112
FROM nvidia/cuda:10.2-base
#CMD nvidia-smi

LABEL maintainer Felipe Gajardo <fgajardoe@gmail.com>

# Install software.
RUN apt-get update && \
    apt-get install -y \
     git \
     vim \
     python3-pip \
     python3-setuptools && \
     pip3 install --upgrade pip && \
     cd /opt && \
     git clone https://github.com/muriloHoracio/TERL && \
     cd TERL && \
     pip3 install -r requirements-gpu.txt

# Set user.
RUN useradd -ms /bin/bash user
RUN echo 'user:user' | chpasswd
USER user
WORKDIR /home/user

RUN alias ll='ls -l'
RUN alias l='ls'
RUN alias xx='exit'

CMD ["/bin/bash"]
