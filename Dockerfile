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
RUN gem install bundler && gem install i18n -v 0.8.6 && gem install nokogiri -v '1.8.0' && gem install pkg-config -v '~> 1.1.7' && gem install nio4r -v '2.1.0' && gem install bcrypt -v '3.1.11' && gem install debug_inspector -v '0.0.3' && gem install byebug -v '9.0.6' && gem install hitimes -v '1.2.6' && gem install ffi -v '1.9.18' && gem install json -v '2.1.0' && gem install puma -v '3.9.1' && gem install pg -v '0.21.0'
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
