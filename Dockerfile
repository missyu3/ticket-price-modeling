FROM ruby:2.7.2
RUN mkdir -p /app/lib
COPY Gemfile* /app/
WORKDIR /app
RUN bundle install
COPY visiter_log.csv /app/
COPY lib /app/lib
