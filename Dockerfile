# Start image custom image from ruby:2.7 image, use 'scratch' to start from scratch
FROM ruby:2.7 

# Sign this masterpiece of a dockerfile
LABEL maintainer="bmarianoleite3@gmail.com"

# Get updated system package and install nodejs
# Concatenante all commands in one line so that every time a new package is installed the system gets updated as well
# Allow apt to work with https-based resources
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    apt-transport-https

# Ensure we install al up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sl https://deb.nodesource.com/setup_14.x | bash -

# Ensure latest packages for yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs \
    yarn

# first gemfile files to keep simple file changes from making docker build run bundle everytime 
COPY Gemfile* /usr/src/app/

# Choose the working directory for docker commands
WORKDIR /usr/src/app

# Install gems necessary for rails app
RUN bundle install
RUN rails db:migrate

# Copy all other files from current folder to the container
COPY . /usr/src/app 

# Run rails server by default
CMD [ "bin/rails", "s", "-b", "0.0.0.0" ] 
