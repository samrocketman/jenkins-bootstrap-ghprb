# jenkins-bootstrap for GHPRB GitHub plugin

This repository is an immutable image of Jenkins comprising of the latest stable
version of the GHPRB plugin.  The purpose here is to help maintainers easily
test upgrades of plugins.

For bootstrap-specific documentation and options refer to the
[jenkins-bootstrap-shared README](jenkins-bootstrap-shared/README.md)

Clone this project:

    git clone --recursive https://github.com/samrocketman/jenkins-bootstrap-jervis.git

Copy `settings.groovy.EXAMPLE` to `settings.groovy`.

Bootstrap and configure Jenkins.

    ./jenkins_bootstrap.sh

# License

* [ASL 2](LICENSE)
