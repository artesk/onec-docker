# Сборка образов для 1С:Платформа

В репозитории находятся файлы для сборки образов [Docker](https://www.docker.com) с платформой [1С:Предприятие](http://v8.1c.ru) 8.3 и утилитами для автоматизации процессов разработки.

> Скрипт скачивания платформы позаимствован отсюда https://github.com/Infactum/onec_dock/blob/master/download.sh :+1:

Отличия от других сборок:

* [Multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) (один Dockerfile для всех вариантов клиента 1с)
* Исправлены юзеры и группы для 1с
* Автосборка для GitLab

## Использование

Добавить переменные окружения:

* ONEC_USERNAME - учетная запись на http://releases.1c.ru
* ONEC_PASSWORD - пароль для учетной записи на http://releases.1c.ru
* ONEC_VERSION - версия платформы 1С:Преприятия 8.3, которая будет в образе
* DOCKER_USERNAME - учетная запись на [Docker Hub](https://hub.docker.com) или другого  репозитория образов

Запустить требуемую сборку через CLI:

### Оглавление

- [Сервер](#сервер)
- [Сервер с дополнительными языками](#сервер-с-дополнительными-языками)
- [Клиент]
- [Клиент с поддержкой VNC]
- [Клиент с дополнительными языками]
- [Тонкий клиент]
- [Тонкий клиент с дополнительными языками]
- [Хранилище конфигурации]
- [rac-gui]
- [gitsync]
- [OneScript](#onescript)
- [vanessa-runner]

### Сервер

[(наверх)](#оглавление)

```bash
# windows
docker build ^
  --build-arg DOCKER_USERNAME=%DOCKER_USERNAME% ^
  --build-arg ONEC_USERNAME=%ONEC_USERNAME% ^
  --build-arg ONEC_PASSWORD=%ONEC_PASSWORD% ^
  --build-arg ONEC_VERSION=%ONEC_VERSION% ^
  -t %DOCKER_USERNAME%/server:%ONEC_VERSION% ^
  -f server/Dockerfile .

#linux
docker build \
  --build-arg DOCKER_USERNAME=${DOCKER_USERNAME} \
  --build-arg ONEC_USERNAME=${ONEC_USERNAME} \
  --build-arg ONEC_PASSWORD=${ONEC_PASSWORD} \
  --build-arg ONEC_VERSION=${ONEC_VERSION} \
  -t %DOCKER_USERNAME%/server:${ONEC_VERSION} \
  -f server/Dockerfile .
```

### Сервер с дополнительными языками

[(наверх)](#оглавление)

```bash
# windows
docker build ^
  --build-arg DOCKER_USERNAME=%DOCKER_USERNAME% ^
  --build-arg ONEC_USERNAME=%ONEC_USERNAME% ^
  --build-arg ONEC_PASSWORD=%ONEC_PASSWORD% ^
  --build-arg ONEC_VERSION=%ONEC_VERSION% ^
  --build-arg nls_enabled=true ^
  -t %DOCKER_USERNAME%/server:%ONEC_VERSION% ^
  -f server/Dockerfile .

#linux
docker build \
  --build-arg DOCKER_USERNAME=${DOCKER_USERNAME} \
  --build-arg ONEC_USERNAME=${ONEC_USERNAME} \
  --build-arg ONEC_PASSWORD=${ONEC_PASSWORD} \
  --build-arg ONEC_VERSION=${ONEC_VERSION} \
  --build-arg nls_enabled=true \
  -t %DOCKER_USERNAME%/server:${ONEC_VERSION} \
  -f server/Dockerfile .
```

### OneScript

[(наверх)](#оглавление)

```bash
# windows
docker build ^
  --build-arg DOCKER_USERNAME=%DOCKER_USERNAME% ^
  --build-arg BASE_IMAGE=client-vnc ^
  --build-arg BASE_TAG=%ONEC_VERSION% ^
  --build-arg ONESCRIPT_VERSION=1.6.0 ^
  -t %DOCKER_USERNAME%/client-oscript-1.6.0:%ONEC_VERSION% ^
  -f oscript/Dockerfile .

#linux
docker build ^
  --build-arg DOCKER_USERNAME=${DOCKER_USERNAME} \
  --build-arg BASE_IMAGE=client-vnc \
  --build-arg BASE_TAG=${ONEC_VERSION} \
  --build-arg ONESCRIPT_VERSION=1.6.0 \
  -t ${DOCKER_USERNAME}/client-oscript-1.6.0:${ONEC_VERSION} \
  -f oscript/Dockerfile .
```

## Как запустить в docker-compose

```bash
docker-compose up -d
```
