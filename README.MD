# How to build a Docker container for Kodi which supports video and sound

## Why?
This provides a sandbox environment for Kodi to run.

## Tested on
- Ubuntu 20.04 (Host)
- PulseAudio
- X11 graphical environment (mouse & keyboard working)

## Build Docker Image named kodi (with the Dockerfile in the repo)
```bash
docker build -t kodi .
```

## Create a new Container
- Two directories are created to be mounted in the container (change these for your environment):
  - $HOME/Downloads/dockerKodi/kodi    (Kodi configurations)
  - $HOME/Downloads/dockerKodi/movies  (Directory for movies to play in Kodi)
```bash
docker container create --name kodi \
-v $HOME/Downloads/dockerKodi/kodi:/home/raiden/.kodi \
-v $HOME/Downloads/dockerKodi/movies:/home/raiden/movies \
-v /run/user/$UID/pulse/native:/tmp/pulseaudio/socket \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY -h $HOSTNAME \
-v $HOME/.Xauthority:/home/raiden/.Xauthority kodi
```

## Create kodi and movies directories manually
- If leaving this to Docker, these volume directories will have permission root:root on the host.
```bash
mkdir $HOME/Downloads/dockerKodi/kodi
mkdir $HOME/Downloads/dockerKodi/movies
```

## Run the Container
```bash
docker start kodi
```
