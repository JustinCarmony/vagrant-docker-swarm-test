#!/bin/bash

vagrant ssh salt -c "salt master1 service.stop consul"
vagrant ssh salt -c "salt master1 service.start consul-bootstrap"
vagrant ssh salt -c "salt master2 service.restart consul"
vagrant ssh salt -c "salt node\\* service.restart consul"

sleep 15

vagrant ssh salt -c "salt master1 service.stop consul-bootstrap"
vagrant ssh salt -c "salt master1 service.start consul"

sleep 3

vagrant ssh salt -c "salt master1 cmd.run '/usr/local/bin/consul members'"