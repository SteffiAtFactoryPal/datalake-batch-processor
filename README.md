# Datalake Batch Processor

## Development

### LocalStack

> **_NOTE:_**
> For easier development, we recommend using [awscli-local](https://github.com/localstack/awscli-local).
> It will automatically recognize the LocalStack instance and use it as the default AWS endpoint.
> Therefore, it has been added to the `requirements.txt`. The documentation below assumes the existence of the `awslocal` command.

You will find a `docker-compose.yml` file in the `localstack` directory.
This file will start a LocalStack instance with a configured S3 bucket.

Before you run it, make sure the `localstack/init-aws.sh` script is executable:
(see: [LocalStack Init Hooks](https://docs.localstack.cloud/references/init-hooks/))

```bash
chmod +x ./localstack/init-aws.sh
```

To test if LocalStack with the S3 instance is running, you can run the following command:

```bash
awslocal s3api list-buckets
```

which should print a list of all existing S3 buckets in your local environment as JSON:

```json
{
    "Buckets": [
        {
            "Name": "my-bucket",
            "CreationDate": "2025-02-17T13:06:48+00:00"
        }
    ]
}
```

You should also be able to list all the files in the bucket:

```bash
aws --endpoint-url=http://localhost:4566 s3 ls s3://my-bucket/
```

which should contain an example parquet files.