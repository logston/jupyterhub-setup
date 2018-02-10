# Node
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash

# Docker
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

# Install apt pkgs
sudo apt-get install -y \
    nodejs \
    build-essential \
    python3-pip \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-venv
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    docker-ce \
    certbot

sudo certbot certonly --standalone --preferred-challenges http -d jupyter.fun

docker pull jupyterhub/singleuser

sudo npm install -g configurable-http-proxy

sudo mkdir -p /srv/jupyterhub
sudo chown -R $USER:$USER /srv/jupyterhub

cd /srv/jupyterhub

python3 -m venv .

source bin/activate

pip install jupyterhub notebook dockerspawner

wget 

sudo ./bin/jupyterhub

