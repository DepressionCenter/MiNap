# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
COPY AWStoOracle.py /AWStoOracle.py 
COPY OracletoAWS.py /OracletoAWS.py
COPY schedule.py /schedule.py
RUN python -m pip install -r requirements.txt


# Make the shell script executable
RUN chmod +x /schedule.py
RUN chmod +x /AWStoOracle.py
RUN chmod +x /OracletoAWS.py


WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "schedule.py"]

