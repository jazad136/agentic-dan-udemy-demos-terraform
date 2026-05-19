import json
import os
bucket_name = os.environ['MESSAGES_BUCKET']

def handler(event, context):
    # print(bucket_name)
    # return {
        # 'statusCode': 200,
        # 'body': json.dumps('Hello from Lambda')
    # }
    method = event['httpMethod']
    if method == 'GET':
        return get_messages()
    if method == 'POST':
        return post_message(event)
    else: 
        return {
            'statusCode': 405,
            'body' : json.dumps('Method Not Allowed')
        }

def get_messages():
    print(bucket_name)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from get')
    }

def post_message(event):
    print(bucket_name)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from post')
    }
