FROM ruby:2.3-alpine
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .rails-rundeps \
      build-base \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      nodejs \
      git


RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

ONBUILD RUN bundle install

COPY . /usr/src/app
