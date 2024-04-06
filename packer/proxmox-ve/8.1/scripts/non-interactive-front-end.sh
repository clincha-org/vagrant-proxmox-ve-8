# Setup non-interactive shell to stop errors
# See: https://github.com/moby/moby/issues/27988
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections