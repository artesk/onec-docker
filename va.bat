docker build ^
  --build-arg ONEC_USERNAME=%ONEC_USERNAME% ^
  --build-arg ONEC_PASSWORD=%ONEC_PASSWORD% ^
  --build-arg ONEC_VERSION=%ONEC_VERSION% ^
  --build-arg VA_VERSION=1.2.036 ^
  --target client-vnc-va ^
  -t %DOCKER_USERNAME%/va:%ONEC_VERSION% ^
  -f client/Dockerfile .
