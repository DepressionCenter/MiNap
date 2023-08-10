#!/usr/bin/env python3
import oracledb
import boto3
import json
from boto3.dynamodb.conditions import Key
from datetime import datetime

def read_config():
    f = open("./config.json")
    config = json.load(f)
    f.close()
    return config

def aws_sync():
    config = read_config()
    dynamo_config = config['dynamodb']
    oracle_config = config['oracle']

    dynamo = boto3.resource('dynamodb', **config['aws'])
    table = dynamo.Table(dynamo_config['session_table_name'])
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

    response = table.scan()

    for item in response['Items']:
        entryid = item['id']
        start_time = datetime.strptime(item['sleepSessionStart'], "%Y-%m-%dT%H:%M:%S.%fZ")
        end_time = datetime.strptime(item['sleepSessionEnd'], '%Y-%m-%dT%H:%M:%S.%fZ')
        survey_data = json.dumps(item['remarks']) if 'remarks' in item else 'no data'
        print(type(start_time), type(end_time))
        print(survey_data)
        try:
            query = "INSERT INTO SESSIONS (PARTICIPANT_ID, STUDY_ID, START_TIME, END_TIME, SURVEY) VALUES (:1, :2, :3, :4, :5)"
            cursor.execute(
                query,(
                    str(item['participantid']),
                    str(item['studyid']),
                    start_time,
                    end_time,
                    survey_data
                )
            )
            print("Inserted entry to Oracle id " + str(entryid))
            connection.commit()
            print('data commited')
        except Exception as e:
            print("Record Insertion failed")
            print(e)
            break


        table.delete_item(
            Key = {
                'id': entryid
            }
        )
        print("AWS deleted entry id " + str(entryid))


if __name__ == "__main__":
    aws_sync()
    print("AWS to Oracle")
