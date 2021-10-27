FROM ruby:3.0.2-buster

LABEL Name=railsmusiccollectionapp Version=0.0.1

# Ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    apt-transport-https \
    nodejs \
    postgresql-client \
    yarn \
    chromium-driver \
    libpq-dev

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock  /tmp/Gemfile.lock
RUN bundle config --local disable_platform_warnings true
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN yarn add bootstrap jquery @popperjs/core bootstrap-icons
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
