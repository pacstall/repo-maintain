FROM ubuntu:latest
LABEL org.opencontainers.image.description "Contains Pacstall 4.3.1 Firebrick2"

SHELL ["/bin/bash", "-l", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Africa/Libreville"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG package="pacstall"

RUN dpkg --add-architecture i386 && apt-get update && apt-get dist-upgrade -y && apt-get install wget curl git sudo nano ca-certificates -y --fix-missing --no-install-recommends && apt-get clean && apt-get autoclean && apt-get autoremove -y

RUN adduser --disabled-password --gecos '' pacstall && adduser pacstall sudo
RUN echo N | sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install\?dnt || wget -q https://pacstall.dev/q/install\?dnt -O -)" && rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chown -R pacstall:pacstall /var/log/pacstall && chown -R pacstall:pacstall /tmp/pacstall
# https://askubuntu.com/a/1026978
RUN rm /etc/apt/apt.conf.d/docker-clean

USER pacstall
WORKDIR /home/pacstall

# ENTRYPOINT ["/bin/bash"]
CMD ["bash"]
