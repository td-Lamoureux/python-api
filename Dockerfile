FROM python:3.9-slim

WORKDIR /work

RUN python -m venv .venv
RUN . .venv/bin/activate

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY main.py .

ENV FLASK_APP=main.py

ENTRYPOINT flask run --host 0.0.0.0
