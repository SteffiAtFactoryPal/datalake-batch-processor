#!/bin/sh

echo "Initializing localstack s3"
awslocal s3 mb s3://my-bucket

echo "Put example file"
awslocal s3 cp /etc/localstack/example.parquet s3://my-bucket/

# todo: finish
echo "Initialize localstack glue"
awslocal glue create-database --database-input '{"Name":"db1"}'
awslocal glue create-table --database db1 --table-input '{"Name":"table1"}'
awslocal glue get-tables --database db1