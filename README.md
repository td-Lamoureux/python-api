# Python API

## Setup
1. Setup a virtual environment
```shell
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```
      
## Running the API
```shell
source .venv/bin/activate
FLASK_APP=main.py flask run
```

## Running tests
```shell
source .venv/bin/activate
pip install -r requirements-test.txt
pytest
```