#!/bin/bash

# Exit the script in case of errors
set -e

SECRET_KEY_BASE="${SECRET_KEY_BASE:-$(rake secret)}"
export SECRET_KEY_BASE

if [ -z "${*}" ]
then
    cd /app && bin/rails db:migrate RAILS_ENV=development && exec bundle exec rails server --binding=0.0.0.0
else
    cd /app && bin/rails db:migrate RAILS_ENV=development && exec bundle exec rails server --binding=0.0.0.0 "$0" "$@" -- "${@}"
fi
