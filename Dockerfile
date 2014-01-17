FROM ubuntu:12.04

RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:brightbox/ruby-ng-experimental
RUN apt-get update -qq && apt-get install -y ruby2.0 ruby2.0-dev build-essential libpq-dev
RUN gem install -v 1.5.2 bundler

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD . /myapp
