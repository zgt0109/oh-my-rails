FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN gem sources --add https://gems.ruby-china.org/  \
                --remove https://rubygems.org/
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

ADD Gemfile* /usr/src/app/

RUN bundle
