ARG DOCKER_USERNAME
ARG BASE_IMAGE=oscript-1.6.0
ARG BASE_TAG

FROM ${DOCKER_USERNAME}/${BASE_IMAGE}:${BASE_TAG}

LABEL maintainer="Alexander Strizhachuk <a.strizhachuk@yandex.ru>"

ARG RUNNER_VER=1.10.0

RUN opm install vanessa-runner@${RUNNER_VER}

ENTRYPOINT ["runner"]
CMD ["help"]
