#!/usr/bin/env python3
import oracledb
import boto3
import json
from boto3.dynamodb.conditions import Attr
import uuid

def read_config():
    f = open("./config.json")
    config = json.load(f)
    f.close()
    return config

def oracle_sync():
    config = read_config()
    dynamo_config = config['dynamodb']
    oracle_config = config['oracle']

    dynamo = boto3.resource('dynamodb', **config['aws'])
    table = dynamo.Table(dynamo_config['table_name'])
    print("Connection established with AWS DynamoDB")

    params = oracledb.ConnectParams(
        host=oracle_config['host'],
        port=oracle_config['port'],
        service_name=oracle_config['service_name']
    )
    connection = oracledb.connect(
        user=oracle_config['user'],
        password=oracle_config['password'],
        params=params
    )
    print("Connection to Oracle successfully established.")
    
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM auth")
    for entry in cursor:
        participantid, studyid = entry
        # print(participantid,studyid)
        response = table.scan(FilterExpression =
            Attr('studyid').eq(str(studyid)) & Attr('participantid').eq(str(participantid)))
        print(response)
        if response['Count'] == 0:
            table.put_item(
                Item = {
                    'id': str(uuid.uuid4()),
                    'participantid': str(participantid),
                    'studyid': str(studyid)
                }
            )
            

    connection.close()



if __name__ == "__main__":
    oracle_sync()
    print("Oracle to AWS")
