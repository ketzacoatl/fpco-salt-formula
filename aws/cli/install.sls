# Install the AWS cli utilities
# requires that pip is already setup
aws-cli:
  pip.installed:
    - bin_env: /usr/local/bin/pip3
    - pkgs:
      - awscli
