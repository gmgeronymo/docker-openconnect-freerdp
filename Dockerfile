from debian:bookworm

run apt-get update
run apt-get -y upgrade
run apt-get -y install --no-install-recommends openconnect freerdp2-x11 tmux sudo

run apt-get clean
run rm -rf /var/lib/apt/lists/*

workdir /root
run addgroup --gid 1000 developer
run adduser developer --ingroup developer --uid 1000 --shell /bin/bash --system --home /developer --shell /bin/bash
run echo "developer ALL=(ALL) ALL"
run echo "%developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

user root
workdir /developer

user developer

