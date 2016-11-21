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


RUN bundle config \
        mirror.https://rubygems.org \
        https://gems.ruby-china.org

RUN mkdir /oh-my-rails
WORKDIR /oh-my-rails


COPY . /oh-my-rails/
