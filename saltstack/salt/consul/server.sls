include:
  - common

consul-group:
  group.present:
    - name: consul
    - require:
      - sls: common


consul-user:
  user.present:
    - name: consul
    - system: True
    - groups:
      - consul
    - require:
      - group: consul-group

consul:
  file.managed:
    - name: /usr/local/bin/consul
    - source: salt://consul/files/binaries/consul_0.6.3_linux_amd64
    - mode: 755
    - require:
      - sls: common

consul-etc:
  file.directory:
    - name: /etc/consul.d
    - require:
      - sls: common

consul-var:
  file.directory:
    - name: /var/consul
    - owner: consul
    - group: consul 
    - file_mode: 744
    - dir_mode: 755
    - require:
      - sls: common



consul-etc-bootstrap:
  file.directory:
    - name: /etc/consul.d/bootstrap
    - require:
      - file: consul-etc

consul-etc-server:
  file.directory:
    - name: /etc/consul.d/server
    - require:
      - file: consul-etc

consul-etc-client:
  file.directory:
    - name: /etc/consul.d/client
    - require:
      - file: consul-etc


consul-bootstap-config:
  file.managed:
    - name: /etc/consul.d/bootstrap/config.json
    - source: salt://consul/files/etc/bootstrap.json
    - template: jinja
    - require:
      - file: consul-etc-bootstrap

consul-server-config:
  file.managed:
    - name: /etc/consul.d/server/config.json
    - source: salt://consul/files/etc/server.json
    - template: jinja
    - require:
      - file: consul-etc-server


consul-server-init-conf:
  file.managed:
    - name: /etc/init/consul.conf
    - source: salt://consul/files/init/consul.conf
    - require:
      - file: consul

consul-bootstrap-init-conf:
  file.managed:
    - name: /etc/init/consul-bootstrap.conf
    - source: salt://consul/files/init/consul-bootstrap.conf
    - require:
      - file: consul

consul-bootstrap-init-override:
  file.managed:
    - name: /etc/init/consul-bootstrap.override 
    - contents: "manual"
    - require:
      - file: consul-bootstrap-init-conf

consul-service:
  service.running:
    - name: consul
    - require:
      - file: consul-server-init-conf



