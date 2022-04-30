# Start image custom image from ruby:2.7 image, use 'scratch' to start from scratch
FROM ruby:2.7 

# Get updated system package and install nodejs
RUN apt-get update -yqq
RUN apt-get install -yqq --no-nistall-recommends nodejs

# Copy files from current folder to the container 
COPY . /usr/src/app/

# Choose the working directory for docker commands
WORKDIR /usr/src/app

# Install gems necessary for rails app
RUN bundle install
