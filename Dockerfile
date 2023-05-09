FROM ruby:2.6.3

#RUN apt-get update -qq && \
#  apt-get install -y build-essential \
#  nodejs\
#  mysql-server\
#  mysql-client
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

WORKDIR /fitO2

COPY Gemfile /fitO2/Gemfile
COPY Gemfile.lock /fitO2/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets