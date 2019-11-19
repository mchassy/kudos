docker run -it --rm \
  --name kudos-development  \
  --env PRJ_DIR=/prj \
  --env DOCKER_URI=508384386034.dkr.ecr.us-east-1.amazonaws.com \
  --privileged  \
  -v $(PWD):/prj:rw \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v ~/.aws:/root/.aws:ro \
  508384386034.dkr.ecr.us-east-1.amazonaws.com/kudos-development
