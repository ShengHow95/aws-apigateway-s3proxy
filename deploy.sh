#!/bin/bash

BUCKET_NAME=jeff-s3-apigateway
STACK_NAME=s3-apigateway

# build dependencies (if any)
sam build

# put openapi file into s3 bucket
aws s3api put-object --bucket $BUCKET_NAME --key $STACK_NAME/openapi-spec.yaml --body ./openapi-spec.yaml

# package sam template (to be compatible with cloudformation template) 
# then upload required files (e.g. dependencies) to specified bucket
sam package --output-template-file packaged.yaml --s3-bucket $BUCKET_NAME --s3-prefix ${STACK_NAME}

# put packaged.yaml file to specified bucket 
aws s3api put-object --bucket $BUCKET_NAME --key $STACK_NAME/packaged.yaml --body ./packaged.yaml

# deploy packaged.yaml file
sam deploy --template-file packaged.yaml --s3-bucket $BUCKET_NAME --s3-prefix ${STACK_NAME} --stack-name $STACK_NAME --capabilities CAPABILITY_IAM --parameter-overrides S3BucketName=${BUCKET_NAME}