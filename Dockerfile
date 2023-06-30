FROM ubuntu:latest
LABEL org.opencontainers.image.description "Contains Pacstall 3.15.0 Rhythm"

SHELL ["/bin/bash", "-l", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Africa/Libreville"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG package="pacstall"

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install wget curl git sudo nano ca-certificates -y --fix-missing --no-install-recommends

RUN adduser --disabled-password --gecos '' pacstall
RUN adduser pacstall sudo
RUN sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install\?dnt || wget -q https://pacstall.dev/q/install\?dnt -O -)"
RUN sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove -y
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chown -R pacstall:pacstall /var/log/pacstall
RUN chown -R pacstall:pacstall /tmp/pacstall

USER pacstall
WORKDIR /home/pacstall

# ENTRYPOINT ["/bin/bash"]
CMD ["bash"]
