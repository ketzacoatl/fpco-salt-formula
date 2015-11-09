# this top.sls defines a map for all hosts (*) to default formula
base:
  '*':
    - apps.common
    - python.pip
    - ufw.default_deny
    - ufw.allow_ssh
    - ufw.enable
    - docker
    - dnsmasq
    - consul
    - consul.dnsmasq
    - consul.template-tool
    - consul.tools
    - nomad.install
    - nomad.config
    - stack.ppa
    - stack.docker_cleanup
    - salt.minion.base
    - salt.minion.consul
    - salt.master
    - salt.file_roots.consul-template
    - users.consul-template
