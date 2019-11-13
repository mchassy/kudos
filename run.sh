docker run -it --rm \
  --name kudos-development \
  --privileged --env PROJECT_ROOT=/prj \
  -u root \
  -v $(PWD)/app:/prj/app \
  -v $(PWD)/env:/prj/env \
  -v $(PWD)/config:/prj/config \
  -v $(PWD)/dev:/prj/dev \
  -v $(PWD)/build:/prj/build \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /Users/markchassy/.aws:/root/.aws:ro \
  508384386034.dkr.ecr.us-east-1.amazonaws.com/kudos-development
