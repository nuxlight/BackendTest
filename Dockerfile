FROM ruby:2.6.6-alpine

WORKDIR /app

ADD . /app

# Install basic programs for gem build process
RUN apk add --update \
  build-base \
  postgresql-dev \
  shared-mime-info \
  tzdata \
  && rm -rf /var/cache/apk/*

# Install rails 6 + bundle
RUN gem install rails -v 6
RUN bundle install

EXPOSE 3000

CMD rails db:migrate RAILS_ENV=development && rails s -b 0.0.0.0