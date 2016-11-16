FROM ruby:2.3
MAINTAINER guxiaobai <sikuan.gu@gmail.com>

ARG name=guxiaobai
ARG email=sikuan.gu@gmail.com

RUN git config --global user.name "$name"       && \
    git config --global user.email "$email"     && \
    git config --global push.default simple

RUN mkdir /oh-my-rails
WORKDIR /oh-my-rails

ADD Gemfile* /oh-my-rails

RUN bundle config \
        mirror.https://rubygems.org \
        https://gems.ruby-china.org \
          && bundle

COPY . /oh-my-rails
