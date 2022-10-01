FROM ruby:3.1.2

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# https://github.com/rubygems/rubygems/issues/5351#issuecomment-1216741599
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]