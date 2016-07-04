#!/bin/bash

#
# builds a production meteor bundle directory
#
set -e

printf "\n[-] clone application...\n\n"

# Customize packages
cd ~
git clone $APP_GIT $APP_SOURCE_DIR
cd $APP_SOURCE_DIR
git submodule init
git submodule update
