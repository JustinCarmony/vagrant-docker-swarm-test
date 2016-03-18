include:
  - common
  - docker.engine
  - docker.compose
  - docker.registrator
  - consul.server

# Run Master
docker-swarm-manager:
  cmd.run: 
    - name: docker run -d --name="swarm-manager" --restart=unless-stopped --net=host swarm -experimental manage -H :4000 --replication --advertise {{ salt['grains.get']('ip4_interfaces:eth1:0') }}:4000 consul://127.0.0.1:8500 
    - unless: docker ps | grep "swarm-manager"
    - require:
      - sls: docker.engine
      - sls: consul.server