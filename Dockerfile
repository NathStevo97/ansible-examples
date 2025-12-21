FROM ubuntu:latest

ARG ssh_user=admin
ENV SSH_USER=${ssh_user}
ARG ssh_password=admin
ENV SSH_PASSWORD=${ssh_password}
ARG ssh_public_key_file=vagrant.pub
ENV SSH_PUBLIC_KEY_FILE=${ssh_public_key_file}
ARG ssh_path=/home/${ssh_user}/.ssh

RUN useradd -rm -d /home/${SSH_USER} -s /bin/bash -g root -G sudo -u 2000 ${SSH_USER}
RUN echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd
RUN mkdir ${ssh_path}
RUN chown ${SSH_USER} ${ssh_path}
RUN chmod 700 ${ssh_path}
COPY ${SSH_PUBLIC_KEY_FILE} ${ssh_path}/authorized_keys
RUN chmod 400 ${ssh_path}/authorized_keys
RUN chown ${SSH_USER} ${ssh_path}/authorized_keys

# Best practice - Include the latest security updates in your image
RUN apt update && apt install -y vim openssh-server sudo

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]