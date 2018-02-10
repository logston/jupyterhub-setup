### INSTALL DEPS
# Basics
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    less

# Node
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash
sudo apt-get update
sudo apt-get install -y nodejs
sudo npm install -g configurable-http-proxy

# Python
sudo apt-get install -y \
    libssl-dev \
    libffi-dev \
    python3-pip \
    python3-dev \
    python3-venv

# Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Certbot
sudo apt-get install certbot -t stretch-backports

### BUILD APPLICATION
# Pull docker images
sudo docker pull jupyterhub/singleuser

# Make application dir
sudo mkdir -p /srv/jupyterhub
sudo chown -R $USER:$USER /srv/jupyterhub

# Make venv
cd /srv/jupyterhub
python3 -m venv .
source bin/activate
pip install jupyterhub notebook dockerspawner jupyterhub-tmpauthenticator

# Install config
wget https://raw.githubusercontent.com/logston/jupyterhub-setup/master/jupyterhub_config.py
