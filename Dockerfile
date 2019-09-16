# Base image:
FROM ruby:2.3.1

# Install dependencies
RUN export LANG=en_US.UTF-8
RUN export LANGUAGE=en_US.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mysql-client apt-transport-https ca-certificates unzip xvfb cmake jq curl

# Install bundler
RUN gem install bundler --no-ri --no-rdoc

# INSTALL CHROME
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list 
RUN apt-get -yqq update

# RUN apt-get -yqq install google-chrome-stable=67.0.3396.99-1
RUN apt-get -yqq install google-chrome-stable 
RUN rm -rf /var/lib/apt/lists/*
