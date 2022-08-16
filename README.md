# Python API

* [Setup](#setup)
* [Running the API](#running-the-api)
    * [Python](#running-the-api---python)
    * [Docker](#running-the-api---docker)
* [Tests](#tests)

## Setup

```shell
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```
      
## Running the API

### Running the API - Python

```shell
source .venv/bin/activate
FLASK_APP=main.py flask run
```

### Running the API - Docker

```shell
docker build -t python-api .
docker run -p 5000 --name python-api -d --rm python-api

# Find the given port
docker port python-api
```

## Tests

```shell
pip install tox
tox
```