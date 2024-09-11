# Credentials

## SSH

Switch to the jenkins user:

```bash

sudo su - jenkins
```

Generate the SSH key (if not already created):

```bash

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

```

Save the key in the default location (`/var/lib/jenkins/.ssh/id_rsa`) and provide a passphrase if needed.

Copy the SSH public key to GitHub:

```
cat ~/.ssh/id_rsa.pub
```

Copy the content of the public key and add it to GitHub under Settings > SSH and GPG keys > New SSH Key.


Go to jenkins, and add the `Private` key to credentials

!> Need to add known host. If you don't know, how to just clone any repo, it will prompt yes/No. Press `YES`
