FROM ruby:2.3-alpine

MAINTAINER Quan Nguyen <quannguyen@bestcoder.info>

RUN apk add --no-cache \
  alpine-sdk \
  tzdata \
  nodejs \
  mariadb-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

RUN npm -v
RUN npm install -g yarn
RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN gem install bundler && gem install i18n -v 0.8.6 && gem install nokogiri -v '1.8.0' && gem install pkg-config -v '~> 1.1.7' && gem install nio4r -v '2.1.0'
RUN bundle config build.nokogiri --use-system-libraries

ENV APP_ROOT /opt/app

WORKDIR $APP_ROOT

COPY Gemfile* $APP_ROOT/
RUN bundle install -j4

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV:-production}
COPY . $APP_ROOT

# Assets precompile
RUN if [ $RAILS_ENV = 'production' ]; then bundle exec rake assets:precompile --trace; fi
# Expose assets for web container
VOLUME $APP_ROOT/public
