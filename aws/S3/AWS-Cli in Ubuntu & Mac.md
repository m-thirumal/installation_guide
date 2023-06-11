# Install AWS CLi

        sudo apt install awscli

# Set Up User config in Ubuntu/Mac OS
1. Create IAM user & have it ready `Access and Secrete key`
2. Create `.aws` folder in your home directory

        cd /home/thirumal

        mkdir .aws

3. Create `credentials` file in `.aws` folder
   
        vi credentials

4. Add the user name inside `[]` and mention default user as `[default]`.

        [default]
        aws_access_key_id=
        aws_secret_access_key=
        region=ca-central-1
        [Thirumal]
        aws_access_key_id=
        aws_secret_access_key=
        region=us-east-1
        [Jessica]
        aws_access_key_id=
        aws_secret_access_key=
        region=ap-south-1

5. Usage of multiple profile.

        aws syc s3://{bucketname}/{folderName}