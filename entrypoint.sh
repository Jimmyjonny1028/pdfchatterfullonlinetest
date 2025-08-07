#!/bin/bash
# This script is the official entrypoint for the Docker container.

# The start command from Render will be passed as arguments to this script.
# We execute whatever command Render tells us to run.
exec "$@"
