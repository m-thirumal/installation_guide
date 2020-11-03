### List buckets 

    aws s3 ls

### Copy Local file from `Local` to `S3`

    aws s3 cp {fileName} s3://{bucketname}/{folderName}

### Copy multiple files from `Local` System to `AWS S3` bucket

    aws s3 cp {loacl_path} s3://{bucketName}/{folderName} --recursive

### Download object from `S3` to local system

    aws s3 cp s3://{bucketNamw}/{folderName} /home/thirumal/Downloads

--Download multiple files

    aws s3 cp s3://{bucketName}/{folderName} /home/thirumal/Downloads/ --recursive