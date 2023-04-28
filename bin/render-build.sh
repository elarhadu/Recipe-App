#!/usr/bin/env bash
# exit on error
set -o errexit

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# Install Ruby 3.2.1 using rbenv
rbenv install 3.2.1
rbenv local 3.2.1

# Install dependencies and run build commands
gem install bundler
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
