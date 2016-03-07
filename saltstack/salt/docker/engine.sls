include:
  - common

docker-engine-install-script:
  file.managed:
    - name: /var/deploy/install-docker-engine.sh
    - source: salt://docker/files/install-docker-engine.sh

docker-engine:
  cmd.run:
      - name: bash /var/deploy/install-docker-engine.sh
      - unless: which docker