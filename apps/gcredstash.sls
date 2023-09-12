{%- set version = '0.4.3' %}
{%- set executable = 'gcredstash-' ~ version ~ '-linux-amd64' %}
{%- set gzip_archive = 'gcredstash_' ~ version ~ '_linux_x86_64.tar.gz' %}
{%- set base_url = 'https://github.com/kgaughan/gcredstash/releases/download' %}
{%- set archive_url = base_url ~ '/' ~ 'v' ~ version ~ '/' ~ gzip_archive %}
{%- set checksum = '4384b17743e316e78c1a90c87cda5fdbb2cc00f7ec10a6042a7c83bc2dc9254e257058ad087d88a7dc0638b1063d20303449c7f7769ce67d41f4773f7ba72a05' %}

gcredstash-archive:
  file.managed:
    - name: /usr/local/bin/{{ gzip_archive }}
    - source: {{ archive_url }}
    - source_hash: sha512={{ checksum }}
    - unless: ls /usr/local/bin/{{ executable }}
  archive.extracted:
    - name: /usr/local/bin/{{ executable }}
    - source: /usr/local/bin/{{ gzip_archive }}
    - if_missing: /usr/local/bin/{{ executable }}
    - options: -z
    - enforce_toplevel: False
  cmd.run:
    - name: chmod +x /usr/local/bin/{{ executable }}/gcredstash
    - watch:
        - archive: gcredstash-archive

gcredstash-bin:
  file.symlink:
    - name: /usr/local/bin/gcredstash
    - target: /usr/local/bin/{{ executable }}/gcredstash
    - require:
        - file: gcredstash-archive
  cmd.run:
    - name: gcredstash --version
    - require:
        - file: gcredstash-bin
        - cmd: gcredstash-archive
