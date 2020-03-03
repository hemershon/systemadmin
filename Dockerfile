FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# https://yarnpkg.com/lang/en/docs/install/#debian-stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y nodejs postgresql-client vim && \
  apt-get install -y yarn && \
  apt-get install -y imagemagick && \
  apt-get install -y libvips-tools && \
  apt-get install -y locales
RUN mkdir /admin
WORKDIR /admin
COPY Gemfile /admin/Gemfile
COPY Gemfile.lock /admin/Gemfile.lock
RUN bundle install
COPY . /admin