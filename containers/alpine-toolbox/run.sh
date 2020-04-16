IMAGE=$DOCKER_URI/alpine-toolbox:latest
docker run -it --rm \
  --name toolbox  \
  --env DOCKER_URI=$DOCKER_URI \
  --privileged  \
  -v $(PWD):/prj:rw \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v ~/.aws:/root/.aws:ro \
  $IMAGE
