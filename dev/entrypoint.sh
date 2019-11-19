#!/bin/bash
if [[ -z "${CI_JOB_STAGE}" ]]
then
    export FLASK_APP=/prj/app/http/api/endpoints.py
    export APP_CONFIG_FILE=/prj/config/integration.py
    export FLASK_ENV=integration
    export PATH="/prj/env/bin:$PATH"
    $(aws ecr get-login --no-include-email --region us-east-1)
    if ! test -f "./env/bin/activate"; then
        echo "#######################################################"
        echo "Creating virtual environment"
        echo "#######################################################"
        python3 -m venv env
    fi
    echo "#######################################################"
    echo "Acitvating virtual environment"
    echo "#######################################################"
    source ./env/bin/activate
    if ! test -f "./env/bin/flask"
    then
        echo "#######################################################"
        echo "Installing pip requirements"
        echo "#######################################################"
        ls -al ./env/bin
        pip install -r ./dev/requirements.txt
    fi
fi

bash
