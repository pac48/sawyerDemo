#!/bin/bash
set -e

# setup ros environment
source "devel/setup.bash"
exec "$@"
