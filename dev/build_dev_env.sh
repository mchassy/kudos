docker rmi $DOCKER_URI/kudos-env:latest
docker rmi kudos-env:latest
docker build -t kudos-env:latest .
if [ $? -eq 0 ]
then
  docker tag kudos-env:latest $DOCKER_URI/kudos-env:latest && docker push $DOCKER_URI/kudos-env:latest
fi
