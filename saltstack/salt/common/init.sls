common:
  pkg.installed:
    - names:
      - build-essential
      - git-core
      - htop
      - strace
      - htop
      - unzip
      # Digital Ocean hasn't update this yet
      # Digial Ocean Setting: Ubuntu 14.04 x64 vmlinuz-3.19.0-51-generic
      #- linux-generic-lts-vivid
      - linux-image-3.19.0-51-generic
      - linux-image-extra-3.19.0-51-generic
      - linux-firmware

var-deploy-directory:
  file.directory:
    - name: /var/deploy    