#!/bin/bash

set -e


printf "\n[-] Installing base OS dependencies...\n\n"

apt-get update -qq -y

apt-get install -qq -y --no-install-recommends curl ssh ca-certificates bzip2 git build-essential python graphicsmagick net-tools vim