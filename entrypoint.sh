#!/bin/sh
# Read in the file of environment settings
. /usr/local/oecore-x86_64/environment-setup-armv7at2hf-neon-angstrom-linux-gnueabi
# Then run the CMD

exec "$@"
