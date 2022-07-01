FROM ubuntu:jammy-20220531
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y wget curl sudo gnupg2 apt-transport-https
ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN echo "tzdata tzdata/Areas select America" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/America select Toronto" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
