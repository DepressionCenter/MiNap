#!/usr/bin/env python3

import subprocess
import sched
import time

#variable to determine how often the script will run autonomously once in production
run_interval = 300 

def execute_sync(sc):
    try:
        subprocess.call(["python3", "AWStoOracle.py"])
    except subprocess.CalledProcessError:
        print("Failed to execute AWStoOracle.py")
    
    try:
        subprocess.call(["python3", "OracletoAWS.py"])
    except subprocess.CalledProcessError:
        print("Failed to execute OracletoAWS.py")

    print("execute the scripts every 3 second")
    
    # Schedule new time for next call
    s.enter(run_interval, 1, execute_sync, (sc,))

# Initialize the scheduler
s = sched.scheduler(time.time, time.sleep)

s.enter(run_interval, 1, execute_sync, (s,))

# Start the scheduler
s.run()
