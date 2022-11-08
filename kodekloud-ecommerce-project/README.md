# Kodekloud Ecommerce Sample Application Playbook

## Prerequisites:

```bash
ansible-galaxy install -r requirements.yml
```

## Deploy App

```bash
ansible-playbook deploy-ecommerce-app.yaml -i inventory.txt

```

## Rollback Deployment

```bash
ansible-playbook undeploy-ecommerce-app.yaml -i inventory.txt

```


# To-Dos:
- Refactoring:
  - Variables (general and also to cover off possible changes in IPs)
  - Roles
  - Templates
