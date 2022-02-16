#!/usr/bin/env sh
#
# Monitors the polling process, restarts it if it dies.

until $(node /appl/polling-swagger-ui/poll.js >&2); do
    echo "Polling process died with exit code $?.  Respawning.." >&2
    sleep 1
done
