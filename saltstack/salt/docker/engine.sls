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

docker-service:
  service.running:
    - name: docker
    - require:
      - cmd: docker-engine

docker-etc-default:
  file.managed:
    - name: /etc/default/docker
    - source: salt://docker/files/etc/docker
    - template: jinja
    - watch_in:
      - service: docker-service