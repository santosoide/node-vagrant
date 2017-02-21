#!/bin/bash

echo ">>> Download NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

. ~/.nvm/nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

echo ">>> Installing nodejs version 6.9.4"
nvm install 6.9.4

echo ">>> Use nodejs version 6.9.4"
nvm use 6.9.4

echo ">>> Install Yarn"
npm install -g yarn

echo ">>> Installing Nodemon"
npm install -g nodemon

echo ">>> Installing Node-gyp"
npm install -g node-gyp

echo ">>> Installing MongoDB"

# Get key and add to sources
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Make MongoDB connectable from outside world without SSH tunnel
if [ $2 == "3.0" ]; then
  echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
else
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
fi

# Update
sudo apt-get update

# Install MongoDB
# -qq implies -y --force-yes
sudo apt-get install -qq mongodb-org
