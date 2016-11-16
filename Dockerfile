FROM ruby:2.3

MAINTAINER guxiaobai <sikuan.gu@gmail.com>

ARG name=guxiaobai
ARG email=sikuan.gu@gmail.com

RUN git config --global user.name "$name"       && \
    git config --global user.email "$email"     && \
    git config --global push.default simple

RUN gem sources --add https://gems.ruby-china.org/  \
                --remove https://rubygems.org/

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN gem install railties -N

RUN mkdir /oh-my-rails
COPY . /oh-my-rails
