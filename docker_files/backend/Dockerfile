FROM ruby:3.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
        && apt-get update -qq \
        && apt-get install -y build-essential libpq-dev nodejs yarn \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /rails6-chat-be
ENV LANG C.UTF-8
ENV APP_ROOT /rails6-chat-be
WORKDIR $APP_ROOT

COPY ./backend/Gemfile $APP_ROOT/Gemfile
COPY ./backend/Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle config --local set path 'backend/vendor/bundle' \
  && bundle install

COPY . $APP_ROOT

COPY ./backend/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]