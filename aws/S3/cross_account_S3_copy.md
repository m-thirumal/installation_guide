# Copy S3 objects from one account to another account S3 bucket

1. Create the buckets or get the bucket names from source and destination account.
2. Attach the following policy to source bucket.

        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "DelegateS3Access",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::DESTINATION_BUCKET_ACCOUNT_NUMBER:user/thirumal"
                    },
                    "Action": [
                        "s3:ListBucket",
                        "s3:GetObject"
                    ],
                    "Resource": [
                        "arn:aws:s3:::SOURCE_BUCKET_NAME/*",
                        "arn:aws:s3:::SOURCE_BUCKET_NAME"
                    ]
                }
            ]
        }

3. Create `IAM` user in the destination account with the following `policy`.


        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": [
                        "s3:ListBucket",
                        "s3:GetObject"
                    ],
                    "Resource": [
                        "arn:aws:s3:::SOURCE_BUCKET_NAME",
                        "arn:aws:s3:::SOURCE_BUCKET_NAME/*"
                    ]
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "s3:ListBucket",
                        "s3:PutObject",
                        "s3:PutObjectAcl"
                    ],
                    "Resource": [
                        "arn:aws:s3:::DESTINATION_BUCKET_NAME",
                        "arn:aws:s3:::DESTINATION_BUCKET_NAME/*"
                    ]
                }
            ]
        }


4. Run the following command with destination `IAM` user in the local machine.

        aws sync s3://sourceBucket/folder_name s3://destinationBucket/folder_name