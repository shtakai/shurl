FROM ruby:2.4.2

ENV LANG C.UTF-8
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev postgresql nodejs

RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP /myapp
RUN mkdir -p $APP
WORKDIR $APP
ADD . $APP
