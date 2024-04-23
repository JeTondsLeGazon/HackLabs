FROM python:3.10-slim-bookworm

COPY main.py /code/
COPY interns/ /home/administration/interns
COPY intern_first_day.txt /home/administration
WORKDIR /code
RUN pip install fastapi uvicorn pydantic

# for healthcheck
RUN apt-get update && apt-get install curl -y

CMD uvicorn main:app --host 0.0.0.0 --port 80