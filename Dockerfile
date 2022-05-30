FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y pulseaudio
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:team-xbmc/ppa
RUN apt-get update
RUN apt-get install -y kodi
RUN apt-get install -y kodi-vfs-libarchive
RUN groupadd -g 1000 raiden
RUN useradd -d /home/raiden -s /bin/bash -m raiden -u 1000 -g 1000
USER raiden
ENV HOME /home/raiden
ENV PULSE_SERVER=unix:/tmp/pulseaudio/socket
CMD /usr/bin/kodi
