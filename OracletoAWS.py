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

# def oracle_sync():
#     dynamo = boto3.resource('dynamodb', region_name="us-east-1",
#                             aws_access_key_id='AKIA4GMGCF37RVNR6ZPJ',
#                             aws_secret_access_key='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')
#     table = dynamo.Table('MinapDBAuth-tjssbdi4drdwhe3ccl7rhryfky-root')
#     print("Connection established to AWS DynamoDB")
#     # load_dotenv()
#     # print(environ.get('ORACLE_HOST'),environ.get('ORACLE_PORT'),environ.get('ORACLE_SERVICE'),environ.get('ORACLE_USER'),environ.get('ORACLE_PASSWORD'))
#     # params = oracledb.ConnectParams(host=environ.get('ORACLE_HOST'), port=environ.get('ORACLE_PORT'), service_name=environ.get('ORACLE_SERVICE'))
#     # connection = oracledb.connect(user=environ.get('ORACLE_USER'), password=environ.get('ORACLE_PASSWORD'), params=params)
#     # params = oracledb.ConnectParams(host="mtcd-db-d1a.med.umich.edu", port=1521, service_name="mtcdd.world")
#     params = oracledb.ConnectParams(host="mtcdd.mcit.med.umich.edu", port=1521, service_name="mtcdd.world")
#     connection = oracledb.connect(user='minap',password='rp45kj4327',params=params)
#     #connection = oracledb.connect(user="yinghal", password="ryur43b81", params=params)
#     print("connection to Oracle successfully established.")
#     cursor = connection.cursor()
#     cursor.execute("SELECT * FROM auth")
#     for entry in cursor:
#         print(entry)
#     connection.close()

# if __name__ == "__main__":
#     oracle_sync()
#     print("Oracle to aws")



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
