[![CircleCI](https://circleci.com/gh/wmb456/DevOps_Microservices.svg?style=svg)](https://circleci.com/gh/wmb456/DevOps_Microservices)

## important

To be able to run the scripts you must provide your own local configuration in _config.sh_ containing the following variables:

| name       | content                                        | example          |
|------------|------------------------------------------------|------------------|
| IMAGE_NAME | name of the docker image                       | udacity-app      | 
| IMAGE_TAG  | docker image tag                               | 0.0.1            |
| HOST_PORT  | port the service is exposed on the docker host | 8000             |
| HUB_USER   | GITHUB user ID                                 | foo              |
| HUB_MAIL   | eMail address of the github user               | foo@example.com  |

**Note:** This file is ignored by git.

Example _config.sh_:
```
#!/bin/bash

IMAGE_NAME=udacity-app
IMAGE_TAG=0.0.1
HOST_PORT=8000

HUB_USER=foo
HUB_MAIL=foo@example.com
```

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
  * creation of venv can be done by running
  ```
  make setup
  ```
  * note that the venv is created in _.devops_
  * you might override the used python version by setting PYTHON in the env to the desired version (e.g. python3.9)
* Run `make install` to install the necessary dependencies
  * note that pylint is not part of the bare application dependencies and therefore must be installed manually, e.g. run
  ```
  pip install pylint
  ```

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

The service is provided on port _80_, see _make\_prediction.sh_ for an example on how to call the service.

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

Just use C9 and install minicube + kubectl.

Note: as the stock EC2 instance will only provide 10G (8G free) of disk space you should resize the root fs to 20G before you start to install anything.

