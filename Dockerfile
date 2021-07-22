FROM ubuntu

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ARG package="pacstall"

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install wget curl git sudo -y

RUN sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"

ENTRYPOINT ["/bin/bash"]
