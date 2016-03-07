# Vagrant Cloud Project Template

A template for creating vagrant based projects that provision in the cloud. This is 
mostly for my projects where I'm learning how to setup clusters of servers and want
to quickly tear down the project inbetween coding sessions.

```
apt-get update ; apt-get -y upgrade ; apt-get -y install apt-transport-https ca-certificates ; apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D ; echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list ; apt-get update ; apt-get -y install linux-image-extra-$(uname -r) ; apt-get -y install apparmor ; apt-get -y install docker-engine ; service docker start ; docker run hello-world
```