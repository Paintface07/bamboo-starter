# bamboo-starter

A starter docker image for running Atlassian Bamboo trials.

## Description
This docker build will start a bamboo server with a default in-memory database and without a
license key.

## Start
```
docker run --publish 8085:8085 paintface07/bamboo-starter
```