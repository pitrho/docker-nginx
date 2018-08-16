# Changelog

## v0.7.1 (2018-08-07)
* Upgraded rancher-gen to version v0.4.1.

## v0.7.0 (2018-08-07)
* Upgraded rancher-gen to version v0.4.0.
* Added ability to create users for basic http auth.

## v0.6.0 (2018-03-30)
* Update Procfile.rancher-gen to have configurable template/destination files.
* Add default values for RANCHER_GEN_TEMPLATE and RANCHER_GEN_DESTINATION
for backwards compatibility

## v0.5.0 (2017-01-18)
* Upgraded rancher-gen to version v0.3.0.

## v0.4.0 (2016-10-07)
* Upgraded rancher-gen to version v0.2.1

## v0.3.0 (2016-09-09)
* Added ability to generate configuration files using rancher-gen.
* Switched from forego to honcho.

## v0.2.0 (2016-06-21)
* Updated forego and docker-gen
* Added ability to pass additional parameters to docker-gen through environment
variable $DOCKERGEN_OPTIONS.

## v0.1.0 (2016-02-15)
* Initial release.
* Uses docker-gen to generate configuration templates.
