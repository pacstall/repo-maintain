#!/bin/bash

STGDIR="$HOME/.local/share/repo-maintain"
mkdir -p "$STGDIR"
mkdir -p ~/.local/bin
echo "Installing Docker"

haveProg() {
    [ -x "$(which $1)" ]
}

# if Debian system is installed
if haveProg apt-get; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# If Arch system is installed
elif haveProg pacman; then
    sudo pacman -S docker --yes
# If OpenSUSE is installed
elif haveProg zypper; then
    sudo zypper install docker
# If RPM system is installed
elif haveProg dnf; then
    sudo dnf -y install dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io
# If Solus system is installed
elif haveProg eopkg; then
    sudo eopkg install docker
else
    echo 'No package manager found!'
    exit 2
fi

sudo usermod -a -G docker $USER

echo "Installing Pacstall via Docker"
docker pull ghcr.io/pacstall/pacstall:latest

cp docker.sh "$STGDIR"
cp mr ~/.local/bin
