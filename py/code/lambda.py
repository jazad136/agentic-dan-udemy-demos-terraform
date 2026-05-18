import json
import os
bucket_name = os.environ['MESSAGES_BUCKET']

def handler(event, context):
    print(bucket_name)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda')
    }
