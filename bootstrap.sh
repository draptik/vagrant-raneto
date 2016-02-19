#!/usr/bin/env bash

## Git ==============================================================
##
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Installing git..."
aptitude install -y git

## NodeJS ===========================================================
##
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Installing Node.js..."
## NodeJS
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
aptitude update
aptitude install -y nodejs build-essential

## This is required if the node project is located on the windows host system.
echo "alias npm='npm --no-bin-links'" >> /home/vagrant/.bashrc

## Proxy settings ---------------------------------------------------
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Configs for node, bower and wget proxy..."
## Proxy settings for node and npm ...................
NPMRC=/vagrant/.npmrc
if [ -f ${NPMRC} ]; then
	cp ${NPMRC} "/home/vagrant/"
	cp ${NPMRC} /root/
	chown vagrant.vagrant "/home/vagrant/.npmrc"
fi

## Proxy settings for bower ...........................
BOWERRC=/vagrant/.bowerrc 
if [ -f ${BOWERRC} ]; then
	cp ${BOWERRC} "/home/vagrant/"
	cp ${BOWERRC} /root/
	chown vagrant.vagrant "/home/vagrant/.bowerrc"
fi

## Proxy settings for wget ............................
WGETRC=/vagrant/.wgetrc
if [ -f ${WGETRC} ]; then
	cp ${WGETRC} "/home/vagrant/"
	cp ${WGETRC} /root/
	chown vagrant.vagrant "/home/vagrant/.wgetrc"
fi




## Install Raneto Wiki ===============================================
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Installing Raneto Wiki..."
#RANETO_PACKED=0.7.1.tar.gz
RANETO_VERSION=0.9.0
RANETO_PACKED=Raneto-${RANETO_VERSION}.tar.gz
cp /vagrant/raneto/${RANETO_PACKED} /home/vagrant/
chown vagrant.vagrant ${RANETO_PACKED}

## Unzip -------------------------------------
su - vagrant -c "tar xzf ${RANETO_PACKED}"

## Install -----------------------------------
echo "[bootstrap.sh] Installing Raneto..."
#su - vagrant -c "cd Raneto-0.7.1 && npm install"
su - vagrant -c "cd Raneto-${RANETO_VERSION} && npm install"

## Backup demo content -----------------------
echo "[bootstrap.sh] Backing up example content..."
su - vagrant -c "mv /home/vagrant/Raneto-${RANETO_VERSION}/example/content /home/vagrant/Raneto-${RANETO_VERSION}/example/content.backup"

## Link custom content -----------------------
echo "[bootstrap.sh] Linking content..."
su - vagrant -c "ln -s /vagrant/wiki-content /home/vagrant/Raneto-${RANETO_VERSION}/example/content"

## Backup wiki configs -----------------------
echo "[bootstrap.sh] Backing up configs..."
su - vagrant -c "mv /home/vagrant/Raneto-${RANETO_VERSION}/example/config.default.js /home/vagrant/Raneto-${RANETO_VERSION}/example/config.default.js.backup"

## custom configs ---------------------------
echo "[bootstrap.sh] Copying our configs..."
su - vagrant -c "cp /vagrant/wiki-configs/config.default.js /home/vagrant/Raneto-${RANETO_VERSION}/example/config.default.js"

echo "[bootstrap.sh] =============================================================================================="
echo "[bootstrap.sh] =============================================================================================="
echo "[bootstrap.sh] =============================================================================================="
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Congratulations! You have installed the Raneto wiki!"
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Next steps:"
echo "[bootstrap.sh] 1. Login to the Vagrant container using 'vagrant ssh'."
echo "[bootstrap.sh] 2. Switch to folder Raneto-0.7.1: 'cd Raneto-*'."
echo "[bootstrap.sh] 3. Then, start the application using 'npm start'."
echo "[bootstrap.sh] 4. You can then view the application in the host browser by visiting http://127.0.0.1:8080"
echo "[bootstrap.sh] "
echo "[bootstrap.sh] Have fun!"
