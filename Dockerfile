FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
            nodejs \
            && rm -rf /var/lib/apt/lists/*

ARG name=guxiaobai
ARG email=sikuan.gu@gmail.com

RUN git config --global user.name "$name"       && \
    git config --global user.email "$email"     && \
    git config --global push.default simple


RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# ENV BUNDLE_GEMFILE=/usr/src/app/Gemfile

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
# RUN bundle install


COPY . /usr/src/app
