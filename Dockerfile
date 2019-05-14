# Use an official Elixir runtime as a parent image
# FROM elixir:latest

# RUN apt-get update && \
#   apt-get install -y postgresql-client inotify-tools

FROM elixir:alpine

ENV DOCKERIZE_VERSION v0.6.1

RUN set xe && \
  apk add --no-cache postgresql-client inotify-tools && \
  rm -rf /var/cache/apk/* && \
  wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
  tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
  rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Create app directory and copy the Elixir projects into it
# RUN mkdir /app
# COPY ./app /app
WORKDIR /app

# Install hex package manager and rebar (was required after test)
RUN mix local.hex --force && mix local.rebar --force
# RUN /root/.mix/rebar3 local install

# Compile the project
# RUN mix do compile

#CMD ["/app/entrypoint.sh"]