FROM python:3.10.5-slim-bullseye

WORKDIR /work

COPY requirements.txt .
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python -m venv .venv && \

# shellcheck source=/work/.venv/bin/activate
RUN . .venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

COPY main.py .

ENV FLASK_APP=main.py

RUN groupadd -r docker && useradd -r -s /bin/false -g docker docker
RUN chown -R docker:docker /work
USER docker

ENTRYPOINT ["flask", "run", "--host", "0.0.0.0"]
