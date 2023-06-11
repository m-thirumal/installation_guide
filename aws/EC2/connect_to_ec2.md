### Prerequisite

1. .pem file

### Login

1. Give permission for `.pem` file

        chmod 600

2. `Login` to `EC2`

        ssh -i {.pem} ubuntu@{ip-dns}

3. Copy files from local system to `ec2`

        scp -i {.pem} /user/thirumal/file_to_copy.pdf ubuntu@{ip}:/home/ubuntu
