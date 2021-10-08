FROM python:3.8.0-slim
COPY . /app

RUN apt-get update 
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get install -y git
RUN apt-get install -y apache2
RUN apt-get install gcc -y 
RUN apt-get clean

WORKDIR app
RUN pip install --user -r requirements.txt
ENTRYPOINT uvicorn main:app --reload --host 0.0.0.0 --port 8080
