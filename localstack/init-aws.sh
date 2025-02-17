#!/bin/sh

echo "Initializing localstack s3"
awslocal s3 mb s3://my-bucket

echo "Put example file"
awslocal s3 cp /etc/localstack/example.parquet s3://my-bucket/