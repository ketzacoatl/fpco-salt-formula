{%- set default_git_url = 'git+https://github.com/salt-formulas/reclass.git@ece09c62d795d4013b8a697d1a41eabbe30130da' %}
{%- set git_url = salt['pillar.get']('reclass:git_url', default_git_url) %}

include:
  - python.pip

reclass:
  pip.installed:
    - bin_env: /usr/local/bin/pip3
    - pkgs:
      - {{ git_url }}
