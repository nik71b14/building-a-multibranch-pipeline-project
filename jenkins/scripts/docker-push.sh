#!/usr/bin/env sh

# Login
# https://docs.docker.com/engine/reference/commandline/login/#credentials-store
echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin

# Cambia nome - NB: l'immagine base deve essere già presente in docker.io!!!
sudo docker tag "test-image:$BUILD_ID" "goinnova/test-image:$BUILD_ID"

# Push
sudo docker push "goinnova/test-image:$BUILD_ID"

# Clean
sudo docker image rm "goinnova/test-image:$BUILD_ID"
