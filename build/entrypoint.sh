#!/bin/bash
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
export FLASK_APP=/kudos/app/http/api/endpoints.py
export APP_CONFIG_FILE=/kudos/config/{{ execution_environment }}.py
export FLASK_ENV={{ execution_environment }}
python3 -m flask run --port 4433 &
cd ./app/http/web/app
npm start &
cd -

bash
