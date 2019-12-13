#!/bin/bash
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
export FLASK_APP=/app/http/api/endpoints.py
export APP_CONFIG_FILE=/config/{{ execution_environment }}.py
export FLASK_ENV={{ execution_environment }}
# python3 -m flask run --port 4433 &
cd /app/http/web/app
npm start &
sleep 5
echo "Go to http://localhost:3001"
bash
