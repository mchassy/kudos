if [ -d "/prj/env/bin" ]
then
    export PATH="/prj/env/bin:$PATH"
    source /prj/env/bin/activate
fi
$(aws ecr get-login --no-include-email --region us-east-1)
