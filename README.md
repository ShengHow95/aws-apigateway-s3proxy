# AWS API Gateway - S3 Proxy Integration
This project demonstrates a simple way to use API Gateway as S3 Proxy to retrieve file content in S3 or upload file to S3 Bucket

## Setup
1. Create a Cloud9 Instance (can be t2.micro free tier)
2. Clone this repo
3. Create an S3 Bucket and replace the `BUCKET_NAME` in `deploy.sh` with the S3 Bucket created
4. Go to the project directory `cd aws-apigateway-s3proxy`
5. Run the `sh deploy.sh`

### Extra Note:
1. API Gateway Maximum Payload (or File Size) <10MB!
2. Suitable for applications that does not require large files (>10MB) from users.
