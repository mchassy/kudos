#!/bin/sh
export FLASK_APP=/prj/kudos/kudos_oss/app/http/api/endpoints.py
export APP_CONFIG_FILE=/prj/kudos/config/development.py
export FLASK_ENV={{ execution_environment }}
python3 -m flask run --port 4433 &
echo "FLASK_APP is $FLASK_APP"
/bin/sh
