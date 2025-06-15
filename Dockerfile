FROM lsiodev/kasmvnc-base:ubuntujammy
#APT_CN_UBUNTU_JAMMY
RUN apt -y install fonts-noto-cjk-extra unzip openssh-server git xz-utils python3-pip konsole nano vim psmisc procps net-tools python3-pip
RUN apt -y install konsole \
	&& apt install -y language-pack-zh-hans \
	&& locale-gen zh_CN.UTF-8 \
	&& update-locale LANG=zh_CN.UTF-8
ENV SHELL=/usr/bin/bash
# kasmvnc autostart and menu
COPY ./root /
