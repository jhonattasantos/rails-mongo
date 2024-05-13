FROM ruby:3.1.2-alpine3.16
ENV LANG C.UTF-8

RUN mkdir /myapp
WORKDIR /myapp

RUN apk update
# ENV NODE_PACKAGE_URL https://unofficial-builds.nodejs.org/download/release/v16.18.1/node-v16.18.1-linux-x64-usdt.tar.gz
# RUN apk add yarn
# RUN wget $NODE_PACKAGE_URL
# RUN mkdir -p /opt/nodejs
# RUN tar -zxvf *.tar.gz --directory /opt/nodejs --strip-components=1
# RUN rm *.tar.gz

# RUN ln -s /opt/nodejs/bin/node /usr/local/bin/node
# RUN ln -s /opt/nodejs/bin/npm /usr/local/bin/npm

RUN apk add libpq
RUN apk add --virtual build-dependencies build-base gcc wget git tzdata shared-mime-info
RUN apk add --update --no-cache \
    build-base \
    mongodb-tools \
    tzdata

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update bundler
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]