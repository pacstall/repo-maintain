FROM ubuntu:impish
LABEL org.opencontainers.image.description "Contains Pacstall 1.7.2 Carmine"

SHELL ["/bin/bash", "-l", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ARG package="pacstall"

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install wget curl git sudo bc nano -y --fix-missing


RUN adduser --disabled-password --gecos '' pacstall
RUN adduser pacstall sudo
RUN sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chmod 755 /var/log/pacstall
RUN chown -R pacstall:pacstall /tmp/pacstall

USER pacstall
WORKDIR /home/pacstall

# ENTRYPOINT ["/bin/bash"]
CMD ["bash"]
