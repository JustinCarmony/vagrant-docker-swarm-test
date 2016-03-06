#!/bin/bash

#rm /root/provision-finished.txt

echo "Checking Salt Installation"
if [ ! -f /root/provision-finished.txt ]; then

	echo "Installing Minion"

    # Install Minion via Bootstrap
	wget -O - http://bootstrap.saltstack.org | sudo sh

	touch /root/provision-finished.txt

fi
echo "Updating Minion Config"
cat /vagrant/deploy/config/minion > /etc/salt/minion

echo "Restarting Salt Minion"
service salt-minion restart

