# Start image custom image from ruby:2.7 image, use 'scratch' to start from scratch
FROM ruby:2.7 

# Get updated system package and install nodejs
# Concatenante all commands in one line so that every time a new package is installed the system gets updated as well
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs

# Copy files from current folder to the container 
COPY . /usr/src/app/

# Choose the working directory for docker commands
WORKDIR /usr/src/app

# Install gems necessary for rails app
RUN bundle install

# Run rails server by default
CMD [ "bin/rails", "s", "-b", "0.0.0.0" ] 
