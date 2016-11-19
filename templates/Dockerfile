FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile* /usr/src/app/

RUN bundle config \
        mirror.https://rubygems.org \
        https://gems.ruby-china.org \
        && bundle
