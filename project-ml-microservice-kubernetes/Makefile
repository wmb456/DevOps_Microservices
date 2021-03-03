## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv .devops
	source .devops/bin/activate

install:
	# This should be run from inside a virtualenv
	( \
	  . .devops/bin/activate; \
	  pip install --upgrade pip; \
	  pip install -r requirements.txt; \
	)

build-container:
	docker build -t project-app:0.0.1 .

run-container:
	docker run -ti --rm --name udacity-app project-app:0.0.1

run-container-sh:
	docker run -ti --rm --name udacity-app-sh project-app:0.0.1 /bin/sh

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint-docker:
	docker run -i --rm  hadolint/hadolint:latest-alpine < Dockerfile

lint-python:
	pylint --disable=R,C,W1203 app.py

lint: lint-docker lint-python

all: install lint test
