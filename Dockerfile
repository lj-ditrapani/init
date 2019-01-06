FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y wget sudo apt-transport-https
ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
