#!/usr/bin/env python3

import oracledb
import boto3
import configparser
# from dotenv import load_dotenv
# from os import environ

# if __name__ == "__main__":
#     print("Oracle to aws")

def read_config():
    config = configparser.ConfigParser()
    config.read('config.json')
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
        port=oracle_config.getint('port'),
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
        print(entry)
    connection.close()

if __name__ == "__main__":
    oracle_sync()
    print("Oracle to AWS")
