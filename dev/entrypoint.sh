#!/bin/bash
export DOCKER_URI=508384386034.dkr.ecr.us-east-1.amazonaws.com
export FLASK_APP=/prj/kudos/kudos_oss/app/http/api/endpoints.py
export APP_CONFIG_FILE=/prj/kudos/config/development.py
export FLASK_ENV=development
cd /prj
if [[ $CI_JOB_STAGE == "" ]]
then
    echo "Running locally"
    if [[ ! -d "./env/bin" ]]
    then
        echo "#######################################################"
        echo "Creating virtual environment"
        echo "#######################################################"
        python3 -m venv env
        echo "#######################################################"
        echo "Activating virtual environment"
        echo "#######################################################"
        source ./env/bin/activate
        pip3 install -r ./dev/requirements.txt
    else
        echo "#######################################################"
        echo "Activating virtual environment"
        echo "#######################################################"
        source ./env/bin/activate
    fi
else
  echo "#######################################################"
  echo "Activating virtual environment"
  echo "#######################################################"
  source ./env/bin/activate
fi

aws ecr get-login --no-include-email --region us-east-1 >&1 | $(sed 's/docker/buildah/')

bash
