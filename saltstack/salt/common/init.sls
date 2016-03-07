common:
  pkg.installed:
    - names:
      - build-essential
      - git-core
      - htop
      - strace
      - htop

var-deploy-directory:
  file.directory:
    - name: /var/deploy    