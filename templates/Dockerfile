FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN mkdir -p /app
WORKDIR /app

RUN bundle config \
        mirror.https://rubygems.org \
        https://gems.ruby-china.org

COPY . /app/
