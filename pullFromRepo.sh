#!/bin/bash
docker login -u "smyaltamash" -p$(cat /var/lib/jenkins/pass)
docker pull smyaltamash/webapp:latest
docker logout
