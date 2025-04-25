FROM redhat/ubi9:latest

# Install required packages for Ansible
RUN dnf -y update && \
    dnf -y install openssh-server sudo python3 which && \
    dnf clean all

# Configure SSH
RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set root password
RUN echo 'root:ansible' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd exec /usr/sbin/init"]