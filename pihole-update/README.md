# Raspberry Pi: Pi-hole Updater

## Setup

Copy the example inventory file and update the appropriate variables enclosed in the `<>` e.g. the hostname and IP address.

```shell
cp inventory.example.ini inventory.ini
```

Execute playbook:

```shell
ansible-playbook -i inventory.ini pihole-update.yaml
```
