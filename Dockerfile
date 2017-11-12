FROM ruby:2.4.2

ENV LANG C.UTF-8
RUN apt-get update -qq
RUN apt-get update && apt-get install -y git nodejs && apt-get clean &&\
    gem install bundler --no-document && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install --without development test&& \
    apt-get clean

RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP /myapp
RUN mkdir -p $APP
WORKDIR $APP
ADD . $APP
RUN mkdir -p tmp/sockets
