docker run -it --rm \
  --network web_default \
  --name kudos-dev \
  --env PROJECT_ROOT=/prj \
  -v /Users/markchassy/git/kudos/kudos_oss:/prj/kudos/kudos_oss \
  -v /Users/markchassy/git/kudos/env:/prj/env \
  -v /Users/markchassy/git/kudos/config:/prj/config \
  -v /Users/markchassy/git/kudos/dev:/prj/dev \
  -v /Users/markchassy/git/kudos/build:/prj/build \
  kudos-env:latest
