include:
  - common
  - docker.engine

docker-compose:
  cmd.run:
    - name: curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose ; chmod +x /usr/local/bin/docker-compose
    - unless: ls /usr/local/bin/docker-compose
    - require:
      - sls: docker.engine