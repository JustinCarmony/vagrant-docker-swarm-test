include:
  - common
  - docker.engine
  - docker.registrator
  - consul.server

# Run Master
docker-swarm-node:
  cmd.run: 
    - name: docker run -d --name="swarm-node" --restart=unless-stopped --net=host swarm -experimental join --advertise {{ salt['grains.get']('ip4_interfaces:eth1:0') }}:2375 consul://127.0.0.1:8500 
    - unless: docker ps | grep "swarm-node"
    - require:
      - sls: docker.engine
      - sls: consul.server