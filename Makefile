## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

PYTHON ?= python3.7

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	$(PYTHON) -m venv .devops

install:
	# This should be run from inside a virtualenv
	( \
	  . .devops/bin/activate; \
	  pip install --upgrade pip; \
	  pip install -r requirements.txt; \
	  pip install pylint; \
	  wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64; \
	  chmod +x ./hadolint \
	)

build-container:
	docker build -t udacity-app:0.0.1 .

run-container:
	docker run -ti --rm --name udacity-app udacity-app:0.0.1

run-container-sh:
	docker run -ti --rm --name udacity-app-sh udacity-app:0.0.1 /bin/sh

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint-docker:
	docker run -i --rm  hadolint/hadolint:latest-alpine < Dockerfile

lint-local:
	./hadolint Dockerfile

lint-python:
	(\
		. .devops/bin/activate && pylint --disable=R,C,W1203 app.py \
	)

lint-dockerized: lint-docker lint-python

lint: lint-local lint-python

all: install lint-local test
