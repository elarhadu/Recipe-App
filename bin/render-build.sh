#!/usr/bin/env bash
# exit on error
set -o errexit

# Install Ruby 3.2.1 using rbenv
rbenv install 3.2.1
rbenv local 3.2.1

# Install dependencies and run build commands
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
