# image name lzh/openstackbase:kilo
FROM debian:jessie

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2015-07-01
ENV OPENSTACK_VERSION kilo


ENV DEBIAN_FRONTEND noninteractive

RUN echo "Asia/Shanghai" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

RUN echo "deb http://debian.ustc.edu.cn/debian/ jessie main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://debian.ustc.edu.cn/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb http://debian.ustc.edu.cn/debian/ jessie-updates main non-free" >> /etc/apt/sources.list
RUN echo "deb http://debian.ustc.edu.cn/debian/ jessie-backports main non-free" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install python-mysqldb crudini mariadb-client supervisor -y
RUN apt-get clean

RUN env --unset=DEBIAN_FRONTEND

CMD ['/bin/bash']