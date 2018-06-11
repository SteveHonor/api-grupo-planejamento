FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /core

WORKDIR /core

COPY Gemfile /core/Gemfile

COPY Gemfile.lock /core/Gemfile.lock

RUN bundle install

COPY . /core
