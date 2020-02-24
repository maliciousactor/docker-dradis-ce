#!/bin/bash

# Exit the script in case of errors
set -e

SECRET_KEY_BASE="${SECRET_KEY_BASE:-$(rake secret)}"
export SECRET_KEY_BASE

if [ -z "${*}" ]
then
#    exec su -m -l dradis -c 'cd /app && exec bundle exec rails server'
    cd /app && bin/rails db:migrate RAILS_ENV=development && exec bundle exec rails server --binding=0.0.0.0
else
#    exec su -m -l dradis -c 'cd /app && exec bundle exec rails server "$0" "$@"' -- "${@}"
    cd /app && bin/rails db:migrate RAILS_ENV=development && exec bundle exec rails server --binding=0.0.0.0 "$0" "$@" -- "${@}"
fi
