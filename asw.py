import boto3
session = boto3.session.Session()
s3 = session.client(
    service_name='s3',
    endpoint_url='https://storage.yandexcloud.net'
)


# Создать новый бакет
# s3.create_bucket(Bucket='newbucket')
breakpoint()
