FROM ruby:3.2.2-alpine

RUN gem install brakeman --version '~> 7.0.0'

COPY lib /action/lib

CMD ["ruby", "/action/lib/index.rb"]
