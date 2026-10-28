
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server python3 sudo && \
    mkdir -p /run/sshd && \
    useradd -m -s /bin/bash ansible && \
    echo "ansible:ansible123" | chpasswd && \
    usermod -aG sudo ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" \
      > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D", "-e"]

