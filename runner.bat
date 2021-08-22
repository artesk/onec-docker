docker build ^
  --build-arg DOCKER_USERNAME=%DOCKER_USERNAME% ^
  --build-arg BASE_IMAGE=oscript-1.6.0 ^
  --build-arg BASE_TAG=%ONEC_VERSION% ^
  -t %DOCKER_USERNAME%/runner:%ONEC_VERSION% ^
  -f vanessa-runner/Dockerfile .
