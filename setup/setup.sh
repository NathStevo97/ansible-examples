#!/bin/bash

# List of container names
CONTAINERS=("ansible-target1" "ansible-target2")

# SSH password to set
SSH_PASSWORD="ansible"

for CONTAINER in "${CONTAINERS[@]}"; do
  echo "Setting up SSH for $CONTAINER..."

  # Configure SSH
  docker exec $CONTAINER ssh-keygen -A
  docker exec $CONTAINER sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
  docker exec $CONTAINER sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

  # Set root password
  docker exec $CONTAINER bash -c "echo 'root:$SSH_PASSWORD' | chpasswd"

  # Start SSH service
  docker exec $CONTAINER /usr/sbin/sshd

  echo "$CONTAINER setup complete!"
done

echo "All containers ready for Ansible!"