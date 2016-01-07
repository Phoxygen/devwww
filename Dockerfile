FROM ruby:2.1
MAINTAINER contact@phoxygen.com

RUN apt-get update \
  && apt-get install -y node

RUN gem install bundler

# we also copy the lock file to ensure we all use the same gems versions.
COPY Gemfile Gemfile.lock ./

RUN bundler install

VOLUME /home/user/src
EXPOSE 4000

WORKDIR /home/user/src
ENTRYPOINT ["jekyll"]
