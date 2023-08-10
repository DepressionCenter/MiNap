# MiNap
Code and documentation for Mi Nap sleep diary smartwatch app and related infrastructure, developed by the 2023 ITS intern cohort at the University of Michigan.

The dbsync branch housed the script to sync data between the two databases. 
OracletoAWS.py is the script responsible for reading the authorization data from Oracle to AWS.
AWStoOracle.py is responsible for reading sleep session data from AWS to Oracle. Once data is read into Oracle, the instance of the data is deleted from the dynamoDB.
The scripts runs on its own as per the schedule assigned within schedule.py.
