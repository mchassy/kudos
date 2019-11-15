#!/bin/bash
export FLASK_APP=/kudos/app/http/api/endpoints.py
export APP_CONFIG_FILE=/kudos/config/{{ execution_environment }}.py
export FLASK_ENV={{ execution_environment }}
echo "FLASK_APP is $FLASK_APP"
python3 -m flask run --port 4433 &

bash
