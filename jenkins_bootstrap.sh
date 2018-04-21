#!/bin/bash
source jenkins-bootstrap-shared/jenkins_bootstrap.sh

if [ ! -r settings.groovy -a -n "${GITHUB_TOKEN}" ]; then
  sed -r "s#(String GITHUB_TOKEN = \")[^\"]+(\".*)#\\1${GITHUB_TOKEN}\\2#" settings.groovy.EXAMPLE > settings.groovy
fi

if [ -r settings.groovy ]; then
  jenkins_console -s ./settings.groovy -s "${SCRIPT_LIBRARY_PATH}"/credentials-multitype.groovy
fi
