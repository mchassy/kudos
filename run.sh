docker run -it --rm \
  --name kudos-development  \
  --env PRJ_DIR=/prj \
  --env DOCKER_URI=508384386034.dkr.ecr.us-east-1.amazonaws.com \
  --env CI_JOB_STAGE="build_image" \
  --privileged  \
  -p 3010:3000 \
  -v $(PWD):/prj:rw \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /Users/markchassy/.aws:/root/.aws:ro \
  508384386034.dkr.ecr.us-east-1.amazonaws.com/kudos-development
