FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y netcat

ENV APP_HOME /rails

WORKDIR $APP_HOME