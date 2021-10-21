docker build ^
  --build-arg DOCKER_USERNAME=%DOCKER_USERNAME% ^
  --build-arg BASE_IMAGE=client-vnc ^
  --build-arg BASE_TAG=%ONEC_VERSION% ^
  --build-arg OPENJDK_VERSION=15 ^
  -t %DOCKER_USERNAME%/jdk:%ONEC_VERSION% ^
  -f jdk/Dockerfile .