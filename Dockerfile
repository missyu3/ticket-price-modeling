FROM ruby:2.7.2
RUN mkdir -p /app/lib
COPY lib /app/lib
COPY Gemfile* visiter_log.csv /app/
RUN cd /app && \
  bundle install
WORKDIR /app