#!/bin/bash
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
export FLASK_APP=/prj/app/http/api/endpoints.py
export APP_CONFIG_FILE=/prj/config/integration.py
export FLASK_ENV=integration
python3 -m flask run --port 4433 &
cd ./app/http/web/app
npm start &
cd -
