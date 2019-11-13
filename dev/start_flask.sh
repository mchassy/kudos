#!/bin/sh
# export PROJECT_DIRECTORY=~/git/kudos
export PROJECT_DIRECTORY=/prj
export FLASK_APP=$PROJECT_DIRECTORY/app/http/api/endpoints.py
export APP_CONFIG_FILE=$PROJECT_DIRECTORY/config/development.py
export FLASK_ENV="developement"
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
python -m flask run --port 4433
