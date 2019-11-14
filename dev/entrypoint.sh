#!/bin/bash
export PRJ_DIR=/builds/mapu/kudos
export DOCKER_URI=508384386034.dkr.ecr.us-east-1.amazonaws.com
export FLASK_APP=$PRJ_DIR/app/http/api/endpoints.py
export APP_CONFIG_FILE=$PRJ_DIR/config/development.py
export FLASK_ENV=development
# export LC_ALL=C.UTF-8
# export LANG=C.UTF-8
if [[ $CI_JOB_STAGE == "" ]]
then
    CI_JOB_STAGE="locally"
elif [[ $CI_JOB_STAGE == "build_image" ]]
then
    echo "Buildah Login"
    aws ecr get-login --no-include-email --region us-east-1 >&1 | $(sed 's/docker/buildah/')
fi
echo "Running $CI_JOB_STAGE"
if test -f "./env/bin/activate"; then
    source ./env/bin/activate
else
    echo "#######################################################"
    echo "Creating virtual environment"
    echo "#######################################################"
    python3 -m venv env
    source ./env/bin/activate
fi
echo "#######################################################"
echo "Virtual environment activated"
echo "#######################################################"
if ! test -f "./env/bin/flask"; then
    echo "#######################################################"
    echo "Installing pip requirments"
    echo "#######################################################"
    pip install -r ./dev/requirements.txt
fi
bash
