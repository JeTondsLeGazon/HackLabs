FROM python:3.10-slim-bookworm

COPY . /code
WORKDIR /code
RUN pip install fastapi uvicorn pydantic

CMD uvicorn main:app --host 0.0.0.0 --port 80