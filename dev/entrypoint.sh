#!/bin/bash
export FLASK_APP=$PRJ_DIR/app/http/api/endpoints.py
export APP_CONFIG_FILE=$PRJ_DIR/config/development.py
export FLASK_ENV=development
# export LC_ALL=C.UTF-8
# export LANG=C.UTF-8
echo "STARTING ENTRYPOINT"
echo "PWD is $PWD"
echo "LISTING FOLDERS"
ls -al
if [[ -z "${CI_JOB_STAGE}" ]]
then
    CI_JOB_STAGE="locally"
fi
echo "CI_JOB_STAGE is $CI_JOB_STAGE"
echo "Running $CI_JOB_STAGE"
if [[ $CI_JOB_STAGE == "build_image" ]]
then
    echo "Buildah Login"
    aws ecr get-login --no-include-email --region us-east-1 >&1 | $(sed 's/docker/buildah/')
fi
if test -f "./env/bin/activate"; then
    echo "#######################################################"
    echo "Activate virtual environment"
    echo "#######################################################"
    source ./env/bin/activate
else
    echo "#######################################################"
    echo "Creating and activate virtual environment"
    echo "#######################################################"
    python3 -m venv env
    source ./env/bin/activate
fi
# if ! test -f "./env/bin/flask"; then
if [[ $CI_JOB_STAGE -eq "locally" ]] && ! test -f "./env/bin/flask"
then
    echo "CI_JOB_STAGE is $CI_JOB_STAGE"
    echo "#######################################################"
    echo "Installing pip requirments"
    echo "#######################################################"
    ls -al ./env/bin
    pip install -r ./dev/requirements.txt
fi

bash
