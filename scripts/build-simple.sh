#!/bin/bash

#
# builds a production meteor bundle directory
#
set -e

printf "\n[-] Building simple, not install packages..\n\n"

: ${APP_BUNDLE_DIR:="/var/www"}
: ${BUILD_SCRIPTS_DIR:="/opt/reaction"}

cd $APP_SOURCE_DIR

# build the source
mkdir -p $APP_BUNDLE_DIR
meteor build --directory $APP_BUNDLE_DIR
