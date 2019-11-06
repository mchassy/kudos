docker run -it --rm \
  --network web_default \
  --name kudos-dev \
  -v /Users/markchassy/git/kudos/kudos_oss:/prj/kudos/kudos_oss \
  -v /Users/markchassy/git/kudos/env:/prj/env \
  -v /Users/markchassy/git/kudos/config:/prj/config \
  -v /Users/markchassy/git/kudos/dev:/prj/dev \
  kudos-env:latest
