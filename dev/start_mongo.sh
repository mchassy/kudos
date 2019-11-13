echo "Starting Mongo ...."
docker run -d --rm \
  --network web_default \
  --name mongo \
  -p 27017:27017 \
  --mount source=mongo_volume,target=/data/db \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME="root" \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD="example" \
  mongo:4-bionic
echo "Starting Mongo Express ...."
docker run -d --rm \
  --network web_default \
  --name mongo-express \
  -p 8081:8081 \
  -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
  -e ME_CONFIG_MONGODB_SERVER="mongo" \
  -e ME_CONFIG_BASICAUTH_USERNAME="user" \
  -e ME_CONFIG_BASICAUTH_PASSWORD="friendly" \
  mongo-express
