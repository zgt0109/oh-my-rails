FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
            nodejs \
            && rm -rf /var/lib/apt/lists/*

RUN bundle config \
        mirror.https://rubygems.org \
        https://gems.ruby-china.org

WORKDIR /usr/src/app
