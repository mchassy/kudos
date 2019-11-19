# docker rmi $DOCKER_URI/kudos-development:latest
# docker build -t $DOCKER_URI/kudos-development:latest .
docker save $DOCKER_URI/kudos-development:latest | sudo docker-squash -t squash -verbose | docker load
docker push $DOCKER_URI/kudos-development:latest
