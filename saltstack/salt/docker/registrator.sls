# Run Master
docker-registrator:
  cmd.run: 
    - name: docker run -d --name="swarm-registrator"  --restart=unless-stopped --net=host --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest consul://localhost:8500

    - unless: docker ps | grep "swarm-registrator"
    - require:
      - sls: docker.engine
      - sls: consul.server