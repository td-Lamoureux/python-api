FROM python:3.10.5-slim-bullseye

WORKDIR /work

COPY requirements.txt .
COPY main.py .

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python -m venv .venv && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=main.py

RUN groupadd -r docker && useradd -r -s /bin/false -g docker docker
RUN chown -R docker:docker /work
USER docker

ENTRYPOINT ["/work/.venv/bin/flask", "run", "--host", "0.0.0.0"]
