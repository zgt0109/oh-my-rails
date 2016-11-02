FROM ruby:2.3

MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN gem install rails

VOLUME /my-app

RUN mkdir /oh-my-rails
COPY . /oh-my-rails
