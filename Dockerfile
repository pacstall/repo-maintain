FROM ubuntu:latest
LABEL org.opencontainers.image.description "Contains Pacstall 3.6.0 Arctic"

SHELL ["/bin/bash", "-l", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Africa/Libreville"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG package="pacstall"

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install wget curl git sudo nano -y --fix-missing


RUN adduser --disabled-password --gecos '' pacstall
RUN adduser pacstall sudo
RUN sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chown -R pacstall:pacstall /var/log/pacstall
RUN chown -R pacstall:pacstall /tmp/pacstall

USER pacstall
WORKDIR /home/pacstall

# ENTRYPOINT ["/bin/bash"]
CMD ["bash"]
