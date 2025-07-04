#!/usr/bin/bash

mkdir -p /opt/tmp
rm -rf /opt/tmp/build-kodi
cp -r . /opt/tmp/build-kodi
pushd /opt/tmp/build-kodi
rm -rf .git


sed -i '1i\# syntax=docker/dockerfile:1.3' Dockerfile

sed -i "/^#APT_CN_UBUNTU_JAMMY.*/i\RUN apt update" Dockerfile
sed -i "/^#APT_CN_UBUNTU_JAMMY.*/i\RUN apt install -y ca-certificates" Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN mv /etc/apt/sources.list /etc/apt/sources.list.back' Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse" >> /etc/apt/sources.list' Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse" >> /etc/apt/sources.list' Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse" >> /etc/apt/sources.list' Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse" >> /etc/apt/sources.list' Dockerfile
sed -i '/^#APT_CN_UBUNTU_JAMMY.*/i\RUN apt update' Dockerfile

./build.sh 192.168.13.73:5000/sleechengn/konsole:latest
docker push 192.168.13.73:5000/sleechengn/konsole:latest

popd
