#!/usr/bin/env python3
import oracledb
import boto3
import json
from boto3.dynamodb.conditions import Key
import uuid

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
    # for item in response['Items']:
    #     entryid = item['id']
    #     print('\n ', item)
    #     if 'remarks' in item:
    #         print(item['participantid'], item['studyid'], item['sleepSessionStart'], item['sleepSessionEnd'], item['remarks'])
    #     else:
    #         item['remarks'] = 'No remarks available.'
    #         print(item['participantid'], item['studyid'], item['sleepSessionStart'], item['sleepSessionEnd'],item['remarks'] )

    #     #print(item['participantid'], item['studyid'], item['sleepSessionStart'], item['sleepSessionEnd'], json.dumps(item['remarks']))
    #     try:
    #         cursor.execute(
    #             f"INSERT INTO SESSIONS (PARTICIPANT_ID, STUDY_ID, START_TIME, END_TIME, REMARKS) \
    #             VALUES ({str(item['participantid'])}, {str(item['studyid'])}, {item['sleepSessionStart']}, {item['sleepSessionEnd']}, {json.dumps(item['remarks'])})"
    #         )
    #         print("Inserted entry to Oracle id " + str(entryid))
    #     except Exception as e:
    #         print("Record Insertion failed")
    #         print(e)
    #         break

    # ... 

    for item in response['Items']:
        entryid = item['id']
        print('\n ', item)
        if 'remarks' in item:
         print(item['participantid'], item['studyid'], item['sleepSessionStart'], item['sleepSessionEnd'], item['remarks'])
        else:
            item['remarks'] = 'No remarks available.'
            print(item['participantid'], item['studyid'], item['sleepSessionStart'], item['sleepSessionEnd'], item['remarks'])

        try:
            cursor.execute(
                "INSERT INTO SESSIONS (PARTICIPANT_ID, STUDY_ID, START_TIME, END_TIME, REMARKS) "
                "VALUES (:part_id, :study_id, :start_time, :end_time, :remarks)",
                part_id=item['participantid'],
                study_id=item['studyid'],
                start_time=item['sleepSessionStart'],
                end_time=item['sleepSessionEnd'],
                remarks=json.dumps(item['remarks'])
            )
            print("Inserted entry to Oracle id " + str(entryid))
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
