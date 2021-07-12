# This is the default script that will setup pacstall in a next to nothing, barebones container. Unless you know what your doing, don't mess with anything in this file
apt update
apt install -y wget sudo curl git nano zip unzip stow
bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
