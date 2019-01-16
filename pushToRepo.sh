#!/bin/bash
docker login -u "smyaltamash" -p$(cat /var/lib/jenkins/pass)
docker push smyaltamash/webapp:latest
docker logout
