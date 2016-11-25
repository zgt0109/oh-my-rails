FROM ruby:alpine
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends \
            nodejs \
            && rm -rf /var/lib/apt/lists/*

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV BUNDLE_GEMFILE=/usr/src/app/Gemfile LANG=C.UTF-8

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

ONBUILD RUN bundle install

COPY . /usr/src/app
