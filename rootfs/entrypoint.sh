#!/bin/sh

set -euo pipefail

if [ "${CROND_ENABLED}" == yes ]
then
    ln -s /s6/.crond /s6/crond
    gen-crontab > /var/spool/cron/crontabs/root
fi

exec "${@}"
