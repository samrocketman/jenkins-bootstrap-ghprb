#!/bin/bash
source jenkins-bootstrap-shared/jenkins_bootstrap.sh

create_job --job-name 'seed' --xml-data './configs/job_seed_config.xml'
#disable job dsl script security
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-job-dsl-security.groovy"
#only enable JNLP4 agent protocol
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-jnlp-agent-protocols.groovy"

if [ ! -r settings.groovy -a -n "${GITHUB_TOKEN}" ]; then
  sed -r "s#(String GITHUB_TOKEN = \")[^\"]+(\".*)#\\1${GITHUB_TOKEN}\\2#" settings.groovy.EXAMPLE > settings.groovy
fi

if [ -r settings.groovy ]; then
  jenkins_console -s ./settings.groovy -s "${SCRIPT_LIBRARY_PATH}"/credentials-multitype.groovy
fi
